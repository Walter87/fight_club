class FightsController < ApplicationController
  expose(:fights)
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

  def fight_now
    sum_of_badges = fight.fighter.badges.length + fight.opponent.badges.length
    fight.winner = fight.fight_now
    gon.skills_allowed = skills_allowed_to_choose
    if sum_of_badges != fight.fighter.badges.length + fight.opponent.badges.length
      flash.keep[:success] = "Winner just got the new badge."
      render 'show'
    else
      render 'show'
    end
  end

  private

  def fight_params
    params.require(:fight).permit(:fighter_id, :opponent_id)
  end

  def skills_allowed_to_choose
    [4,5].any? { |x| x == fight.winner.badges.last.id } ? 1 : 2
  end
end
