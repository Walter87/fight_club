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

class Fighter < ActiveRecord::Base
attr_accessor :hp
has_many :badges , through: :levels
has_many :levels
has_and_belongs_to_many :skills
has_many :fights
has_many :verdicts, through: :fights
has_many :opponents, through: :fights
has_many :wins, class_name: "Verdict", foreign_key: "winner_id"
has_many :loses, class_name: "Verdict", foreign_key: "loser_id"
has_many :inverse_fights, class_name: "Fight", foreign_key: "opponent_id"
has_many :inverse_opponents, through: :inverse_fights, source: :fighter
validates :first_name, :last_name, presence: true
has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
validates :first_name, :last_name, length: { in: 2..20 }

def change_points(options)
  if Gioco::Core::KINDS
    points = options[:points]
    kind   = Kind.find(options[:kind])
  else
    points = options
    kind   = false
  end

  if Gioco::Core::KINDS
    raise "Missing Kind Identifier argument" if !kind
    old_pontuation = self.points.where(:kind_id => kind.id).sum(:value)
  else
    old_pontuation = self.points.to_i
  end
  new_pontuation = old_pontuation + points
  Gioco::Core.sync_resource_by_points(self, new_pontuation, kind)
end

def next_badge?(kind_id = false)
  if Gioco::Core::KINDS
    raise "Missing Kind Identifier argument" if !kind_id
    old_pontuation = self.points.where(:kind_id => kind_id).sum(:value)
  else
    old_pontuation = self.points.to_i
  end
  next_badge       = Badge.where("points > #{old_pontuation}").order("points ASC").first
  last_badge_point = self.badges.last.try('points')
  last_badge_point ||= 0

  if next_badge
    percentage      = (old_pontuation - last_badge_point)*100/(next_badge.points - last_badge_point)
    points          = next_badge.points - old_pontuation
    next_badge_info = {
                        :badge      => next_badge,
                        :points     => points,
                        :percentage => percentage
                      }
  end
end


  def attacks
    self.skill_ids & [1,2,5,6,7,12,13,14,18,19]
  end

  def defences
    self.skill_ids & [3,4,8,9,10,11,15,16,17,20,21]
  end

  private

    def jab(attacker,defencer)
      string_returned = ""
      luckily = rand
      if defencer.skill_ids.include? 8
        string_returned += "#{defencer.first_name} is blocking the jab."
        string_returned += counter_attack(attacker,defencer)
      elsif luckily > 0.7
        string_returned += "#{attacker.first_name} is missing."
      else
        defencer.hp -= 10
        string_returned += "#{defencer.first_name} takes the jab"
      end
    end

    def cross(attacker,defencer)
      string_returned = ""
      luckily = rand
      if (defencer.skill_ids & [3,4,9,10,15,16,21]).length > 0
        string_returned += "#{defencer.first_name} protects himself very well."
        string_returned += counter_attack(attacker,defencer)
      elsif luckily > 0.7
        string_returned += "..missing."
      else
        defencer.hp -= 12
        string_returned += "Oh yes, he takes the cross."
      end
    end

    def left_body_hook(attacker,defencer)
      string_returned = ""
      luckily = rand
      if defencer.skill_ids.include? 17
        string_returned += "#{defencer.first_name} is blocking the hook."
        string_returned += counter_attack(attacker,defencer)
      elsif luckily > 0.7
        string_returned += "#{attacker.first_name} is missing. What is going on."
      else
        defencer.hp -= 15
        string_returned += "#{defencer.first_name} gets hit. His body is not happy now."
      end
    end

    def left_hook(attacker,defencer)
      string_returned = ""
      luckily = rand
      if defencer.skill_ids.include? 17
        string_returned += "#{defencer.first_name} is blocking the hook."
        string_returned += counter_attack(attacker,defencer)
      elsif luckily > 0.7
        string_returned += "#{attacker.first_name} throws a hook but it didn't find the way."
      else
        defencer.hp -= 10
        string_returned += "#{defencer.first_name} gets hit. This is left hook power."
      end
    end

    def body_jab(attacker,defencer)
      string_returned = ""
      luckily = rand
      if defencer.skill_ids.include? 8
        string_returned += "#{defencer.first_name} is blocking the jab."
        string_returned += counter_attack(attacker,defencer)
      elsif luckily > 0.7
        string_returned += "#{attacker.first_name} is missing."
      else
        defencer.hp -= 10
        string_returned += "#{defencer.first_name} takes the jab"
      end
    end

    def left_uppercut(attacker,defencer)
      string_returned = ""
      luckily = rand
      if defencer.skill_ids.include? 11
        string_returned += "#{defencer.first_name} is blocking the uppercat."
        string_returned += counter_attack(attacker,defencer)
      elsif luckily > 0.7
        string_returned += "#{attacker.first_name} is missing next to opponent's chin. Happy #{defencer.last_name}"
      else
        defencer.hp -= 13
        string_returned += "#{defencer.first_name} gets chin hit. No lucky at all."
      end
    end

    def right_uppercut(attacker,defencer)
      string_returned = ""
      luckily = rand
      if defencer.skill_ids.include? 11
        string_returned += "#{defencer.first_name} is blocking the uppercat."
        string_returned += counter_attack(attacker,defencer)
      elsif luckily > 0.7
        string_returned += "Missing."
      else
        defencer.hp -= 13
        string_returned += "He took it. It hurts."
      end
    end

    def right_hook(attacker,defencer)
      string_returned = ""
      luckily = rand
      if defencer.skill_ids.include? 17
        string_returned += "#{defencer.first_name} is blocking the hook."
        string_returned += counter_attack(attacker,defencer)
      elsif luckily > 0.7
        string_returned += "#{attacker.first_name} throws a hook but it didn't find the way."
      else
        defencer.hp -= 15
        string_returned += "He catched him."
      end
    end

    def body_cross(attacker,defencer)
      string_returned = ""
      luckily = rand
      if (defencer.skill_ids & [3,4,9,10,15,16,21]).length > 0
        string_returned += "#{defencer.first_name} protects himself very well."
        string_returned += counter_attack(attacker,defencer)
      elsif luckily > 0.7
        string_returned += "..missing."
      else
        defencer.hp -= 8
        string_returned += "Oh yes, he takes the body cross. Catched him like a kid."
      end
    end

    def right_body_hook(attacker,defencer)
      string_returned = ""
      luckily = rand
      if defencer.skill_ids.include? 17
        string_returned += "#{defencer.first_name} is blocking the hook."
        string_returned += counter_attack(attacker,defencer)
      elsif luckily > 0.7
        string_returned += "Missed."
      else
        defencer.hp -= 15
        string_returned += "He catched him."
      end
    end

    def counter_attack(attacker,defencer)
      if defencer.skill_ids.include? 20
        if rand > 0.7
          "#{defencer.last_name} takes a counter attack but he is missing."
        else
          attacker.hp -= 20
          "#{defencer.last_name} takes a counter attack and it finds its way. What a shot!!!"
        end
      else
        "Boxers are getting back to distance."
      end
    end
  end
