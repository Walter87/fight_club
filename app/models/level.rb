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

class Level < ActiveRecord::Base
belongs_to :badge  
belongs_to :fighter  
end
