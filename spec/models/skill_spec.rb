require 'rails_helper'

RSpec.describe Skill, type: :model do
   context "associations" do
    it { is_expected.to belong_to(:badge) }
    it { is_expected.to have_and_belong_to_many(:fighters) }
  end
end
