class FightsController < ApplicationController
  expose(:fights) { Fight.all.includes(:fighter, :opponent)}
  expose(:fight)
  expose(:fighter)
  expose(:opponent)
  expose(:verdict)

  def create
    self.fight = Fight.new(fight_params)
    if fight.save
      redirect_to fight, notice: 'Fight was successfully created.'
    else
      render :new
    end
  end

  def destroy
    if fight.destroy
      redirect_to fights_url, notice: 'Fight was successfully destroyed.'
    end
  end

  def update
    if fight.relation
      redirect_to fight, notice: "You can not edit this fight. The fight already had place."
    else
      if fight.update(fight_params)
        redirect_to fight, notice: 'Fight was successfully updated.'
      else
        render :edit
      end
    end
  end

  def fight_now
    sum_of_badges = fight.fighter_badges.length + fight.opponent_badges.length
    if fight.winner = fight.fight_now
      gon.skills_allowed = skills_allowed_to_choose
      if sum_of_badges != fight.fighter_badges.length + fight.opponent_badges.length
        flash.keep[:success] = "Winner just got the new badge."
        render 'show'
      else
        redirect_to fight, flash: { success: "Fight is over. #{fight.winner_first_name} won the fight." }
      end
    else
      redirect_to fight, notice: "This fight already had a place."
    end
  end

  private

  def fight_params
    params.require(:fight).permit(:fighter_id, :opponent_id)
  end

  def skills_allowed_to_choose
    [4,5].any? { |x| x == fight.winner_badges.last.id } ? 1 : 2
  end
end
