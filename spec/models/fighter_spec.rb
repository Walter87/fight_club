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
#

require 'rails_helper'

RSpec.describe Fighter, type: :model do
  it "has a valid factory" do
    expect(build(:fighter)).to be_valid
  end
  it 'has an invalid factory without first_name' do
    expect(build(:fighter, first_name: '')).to_not be_valid
  end
  it 'has an invalid factory without last_name' do
    expect(build(:fighter, last_name: '')).to_not be_valid
  end
  it { is_expected.to validate_presence_of(:first_name) }
  it { is_expected.to validate_presence_of(:last_name) }
end
