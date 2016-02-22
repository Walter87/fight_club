# == Schema Information
#
# Table name: badges
#
#  id         :integer          not null, primary key
#  name       :string
#  points     :integer
#  default    :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :badge do
    name "MyString"
    points 1
    default false
  end
end
