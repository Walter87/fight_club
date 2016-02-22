# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require "#{Rails.root}/db/gioco/db.rb"
skills = [["jab","cross","going around","balance","left body hook"],["left hook","body jab","blocking a jab","parry a punch","going away"],
["blocking an uppercut","left uppercut","right uppercut","right hook"],["rolling","slipping","blocking a hook"],["combo","countering"]]
skills.each do |x|
  x.each do |y|
    Skill.create({
                  :name => y,
                  :badge_id => skills.index(x)+1,
                })
  end
end
puts '> Skills successfully created'
