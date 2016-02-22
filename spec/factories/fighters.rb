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

FactoryGirl.define do
  factory :fighter do
    first_name "John"
    last_name "Doeu"
    description "Extra Fighter"
  end
end
