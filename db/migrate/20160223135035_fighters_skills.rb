class FightersSkills < ActiveRecord::Migration
  def change
    create_table :fighters_skills, :id => false do |t|
      t.integer :fighter_id
      t.integer :skill_id
    end
  end
end
