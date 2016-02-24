class FightsController < ApplicationController
  expose(:fights)
  expose(:fight)
  expose(:fighter)
  expose(:opponent)

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

  private

  def fight_params
    params.require(:fight).permit(:fighter_id, :opponent_id)
  end

end
