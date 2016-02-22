# == Schema Information
#
# Table name: levels
#
#  id         :integer          not null, primary key
#  badge_id   :integer
#  fighter_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :level do
    badge_id 1
    fighter_id 1
  end
end
