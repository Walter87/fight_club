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

require 'rails_helper'

RSpec.describe Level, type: :model do
  context "associations" do
    it { is_expected.to belong_to(:badge) }
    it { is_expected.to belong_to(:fighter) }
  end
end
