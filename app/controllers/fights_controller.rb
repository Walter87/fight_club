class FightsController < ApplicationController
  expose(:fights)
  expose(:fight)

  def create
    self.fight = Fighter.new(fight_params)
    if fight.save
      redirect_to fight, notice: 'Fight was successfully created.'
    else
      render :new
    end
  end

  private

  def fight_params
    params.require(:fights).permit(:user_id, :opponent_id)
  end

end
