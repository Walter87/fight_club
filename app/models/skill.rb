class Skill < ActiveRecord::Base
  belongs_to :badge
  has_and_belongs_to_many :fighters
end
