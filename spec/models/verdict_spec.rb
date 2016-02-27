require 'rails_helper'

RSpec.describe Verdict, type: :model do
  context "associations" do
    it { is_expected.to belong_to(:fight) }
  end
  context "validations" do
    it { is_expected.to validate_presence_of(:winner_id)}
    it { is_expected.to validate_presence_of(:loser_id)}
  end
end
