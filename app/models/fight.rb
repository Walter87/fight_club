class Fight < ActiveRecord::Base
  belongs_to :fighter
  belongs_to :opponent, class_name: "Fighter"
end
