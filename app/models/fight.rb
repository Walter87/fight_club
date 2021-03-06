class Fight < ActiveRecord::Base
  attr_accessor :course
  attr_accessor :winner
  delegate :badges, to: :fighter, prefix: true, allow_nil: false
  delegate :badges, to: :opponent, prefix: true, allow_nil: false
  delegate :badges, :first_name, to: :winner, prefix: true, allow_nil: false
  belongs_to :fighter
  belongs_to :opponent, class_name: "Fighter"
  has_one :verdict
  validates :fighter_id, :opponent_id, presence: :true
  validate :opponent_cant_be_fighter


  def opponent_cant_be_fighter
    if fighter_id.present? && opponent_id.present? && fighter_id == opponent_id
      errors.add(:opponent_id, "can't be the same as fighter")
    end
  end


  def fight_now
    return false if self.relation
    self.fighter.hp = 100
    self.opponent.hp = 100
    self.course = []
    fighters = [self.fighter, self.opponent].sort! {|a,b|  a.points <=> b.points}
    probability = fighters[0].points.to_f / (fighters[1].points + fighters[0].points)
    probability = probability < 0.3 ? 0.3 : probability
    while self.fighter.hp * self.opponent.hp > 0 do
      luckily = rand
      if luckily > probability
        rally fighters[1],fighters[0]
      else
        rally *fighters
      end
    end
    winner = fighters.detect {|fighter| fighter.hp > 0}
    loser = fighters.detect {|fighter| fighter.hp <= 0}
    self.create_verdict!(winner_id: winner.id, loser_id: loser.id)
    self.course << "This is the end. After that punch #{winner.first_name} #{winner.last_name} wins the fight."
    self.relation = self.course.map(&:inspect).join("\n- ")
    self.save
    winner.change_points(10)
    $actual_skills = winner.skill_ids
    winner
  end

  private

    def rally(attacker,defencer)
      attack = Skill.find_by_id(attacker.attacks.sample)
      self.course << "#{attacker.first_name} sends #{attack.name} to #{defencer.first_name}"
      action = attacker.send attack.name.to_sym, defencer
      self.course << action
    end

end
