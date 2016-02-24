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

