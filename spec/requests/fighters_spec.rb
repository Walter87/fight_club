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

RSpec.describe "Fighters", type: :request do
  describe "GET /fighters" do
    it "works! (now write some real specs)" do
      get fighters_path
      expect(response).to have_http_status(200)
    end
  end
end
