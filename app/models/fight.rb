class Fight < ActiveRecord::Base
  attr_accessor :course
  belongs_to :fighter
  belongs_to :opponent, class_name: "Fighter"

  validates :fighter_id, :opponent_id, presence: :true


  def fight_now()
    self.fighter.hp = 100
    self.opponent.hp = 100
    self.course = []
    fighters = [self.fighter, self.opponent].sort! {|a,b|  a.points <=> b.points}
    probability = fighters[0].points.to_f / (fighters[1].points + fighters[0].points)
    probability = probability < 0.3 ? 0.3 : probability
    while self.fighter.hp * self.opponent.hp > 0 do
      luckily = rand
      puts luckily
      puts probability
      if luckily > probability
        rally fighters[1],fighters[0]
      else
        rally *fighters
      end
    end
    winner = fighters.detect {|fighter| fighter.hp > 0}
    self.course << "This is the end. After that punch #{winner.first_name} #{winner.last_name} wins the fight."
    winner.change_points(10)
  end

  private

    def rally(attacker,defencer)
      attack = Skill.find_by_id(attacker.attacks.sample)
      self.course << "#{attacker.first_name} sends #{attack.name} to #{defencer.first_name}"
      action = attacker.send attack.name.to_sym, attacker, defencer
      self.course << action
    end

end
