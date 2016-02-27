# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require "#{Rails.root}/db/gioco/db.rb"
skills = [[:jab,:cross,:going_around,:balance,:left_body_hook],
[:left_hook,:body_jab,:blocking_a_jab,:parry_a_punch,:going_away],
[:blocking_an_uppercut,:left_uppercut,:right_uppercut,:right_hook],
[:rolling,:slipping,:blocking_a_hook, :body_cross],
[:right_body_hook,:countering,:clinch]]
skills.each do |x|
  x.each do |y|
    Skill.create({
                  :name => y,
                  :badge_id => skills.index(x)+1,
                })
  end
end
puts '> Skills successfully created'

fighter1 = Fighter.create!(
  first_name:  "John",
  last_name:   "Rambo",
  skill_ids: [1,2,3]
    )

fighter2 = Fighter.create!(
  first_name:  "Muhammad",
  last_name:   "Ali",
  skill_ids: [1,3,4]
    )

fighter3 = Fighter.create!(
  first_name:  "Roy",
  last_name:   "Jones Jr",
  skill_ids: [1,3,4]
    )

fighter1.change_points(1);
fighter2.change_points(1);
fighter3.change_points(1);
