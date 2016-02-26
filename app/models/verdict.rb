class Verdict < ActiveRecord::Base
  belongs_to :fight
  validates :winner_id, :loser_id, presence: true
end
