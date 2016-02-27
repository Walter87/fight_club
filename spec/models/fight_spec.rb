require 'rails_helper'

RSpec.describe Fight, type: :model do
  context "associations" do
    it { is_expected.to belong_to(:fighter) }
    it { is_expected.to belong_to(:opponent) }
    it { is_expected.to have_one(:verdict) }
  end
  context "validations" do
    it { is_expected.to validate_presence_of(:fighter_id) }
    it { is_expected.to validate_presence_of(:opponent_id) }
  end
end
