# == Schema Information
#
# Table name: fighters
#
#  id                  :integer          not null, primary key
#  first_name          :string
#  last_name           :string
#  description         :text
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  avatar_file_name    :string
#  avatar_content_type :string
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#  points              :integer
#

class FightersController < ApplicationController
  expose(:fighters)
  expose(:fighter)
  expose(:levels)


  def create
    self.fighter = Fighter.new(fighter_params)
    if fighter.save
      fighter.change_points(1)
      redirect_to fighter, notice: 'Fighter was successfully created.'
    else
      render :new
    end
  end

  def ranking
    @ranking = Gioco::Ranking.generate
  end

  def update
    if $actual_skills
      params_merged = fighter_params.merge(skill_ids:  $actual_skills.map(&:to_s)+params[:fighter][:skill_ids])
    else
      params_merged = fighter_params
    end
    $actual_skills = nil
    if self.fighter.update(params_merged)
      redirect_to fighter, notice: 'Fighter was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    if fighter.destroy
      redirect_to fighters_url, notice: 'Fighter was successfully destroyed.'
    end
  end

  private
    def fighter_params
      params.require(:fighter).permit(:first_name, :last_name, :description, :avatar, skill_ids: [])
    end

end
