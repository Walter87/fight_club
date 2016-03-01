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
  context "associations" do
    it { is_expected.to have_many(:badges) }
    it { is_expected.to have_many(:levels) }
    it { is_expected.to have_many(:fights) }
    it { is_expected.to have_many(:inverse_fights) }
    it { is_expected.to have_many(:verdicts) }
    it { is_expected.to have_many(:opponents) }
    it { is_expected.to have_many(:inverse_opponents) }
    it { is_expected.to have_many(:loses) }
    it { is_expected.to have_many(:wins) }
    it { is_expected.to have_and_belong_to_many(:skills)  }
  end
  context "validations" do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_length_of(:first_name) }
    it { is_expected.to validate_length_of(:last_name) }
  end
end
