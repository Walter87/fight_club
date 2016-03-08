class AttackType
  attr_reader :fighter

  def initialize(fighter)
    @fighter = fighter
  end

    def jab(defencer)
      string_returned = ""
      luckily = rand
      if defencer.skill_ids.include? 8
        string_returned += "#{defencer.first_name} is blocking the jab."
        string_returned += counter_attack(defencer)
      elsif luckily > 0.7
        string_returned += "#{@fighter.first_name} is missing."
      else
        defencer.hp -= 10
        string_returned += "#{defencer.first_name} takes the jab"
      end
    end

    def cross(defencer)
      string_returned = ""
      luckily = rand
      if (defencer.skill_ids & [3,4,9,10,15,16,21]).length > 0
        string_returned += "#{defencer.first_name} protects him@fighter very well."
        string_returned += counter_attack(defencer)
      elsif luckily > 0.7
        string_returned += "..missing."
      else
        defencer.hp -= 12
        string_returned += "Oh yes, he takes the cross."
      end
    end

    def left_body_hook(defencer)
      string_returned = ""
      luckily = rand
      if defencer.skill_ids.include? 17
        string_returned += "#{defencer.first_name} is blocking the hook."
        string_returned += counter_attack(defencer)
      elsif luckily > 0.7
        string_returned += "#{@fighter.first_name} is missing. What is going on."
      else
        defencer.hp -= 15
        string_returned += "#{defencer.first_name} gets hit. His body is not happy now."
      end
    end

    def left_hook(defencer)
      string_returned = ""
      luckily = rand
      if defencer.skill_ids.include? 17
        string_returned += "#{defencer.first_name} is blocking the hook."
        string_returned += counter_attack(defencer)
      elsif luckily > 0.7
        string_returned += "#{@fighter.first_name} throws a hook but it didn't find the way."
      else
        defencer.hp -= 10
        string_returned += "#{defencer.first_name} gets hit. This is left hook power."
      end
    end

    def body_jab(defencer)
      string_returned = ""
      luckily = rand
      if defencer.skill_ids.include? 8
        string_returned += "#{defencer.first_name} is blocking the jab."
        string_returned += counter_attack(defencer)
      elsif luckily > 0.7
        string_returned += "#{@fighter.first_name} is missing."
      else
        defencer.hp -= 10
        string_returned += "#{defencer.first_name} takes the jab"
      end
    end

    def left_uppercut(defencer)
      string_returned = ""
      luckily = rand
      if defencer.skill_ids.include? 11
        string_returned += "#{defencer.first_name} is blocking the uppercat."
        string_returned += counter_attack(defencer)
      elsif luckily > 0.7
        string_returned += "#{@fighter.first_name} is missing next to opponent's chin. Happy #{defencer.last_name}"
      else
        defencer.hp -= 13
        string_returned += "#{defencer.first_name} gets chin hit. No lucky at all."
      end
    end

    def right_uppercut(defencer)
      string_returned = ""
      luckily = rand
      if defencer.skill_ids.include? 11
        string_returned += "#{defencer.first_name} is blocking the uppercat."
        string_returned += counter_attack(defencer)
      elsif luckily > 0.7
        string_returned += "Missing."
      else
        defencer.hp -= 13
        string_returned += "He took it. It hurts."
      end
    end

    def right_hook(defencer)
      string_returned = ""
      luckily = rand
      if defencer.skill_ids.include? 17
        string_returned += "#{defencer.first_name} is blocking the hook."
        string_returned += counter_attack(defencer)
      elsif luckily > 0.7
        string_returned += "#{@fighter.first_name} throws a hook but it didn't find the way."
      else
        defencer.hp -= 15
        string_returned += "He catched him."
      end
    end

    def body_cross(defencer)
      string_returned = ""
      luckily = rand
      if (defencer.skill_ids & [3,4,9,10,15,16,21]).length > 0
        string_returned += "#{defencer.first_name} protects him@fighter very well."
        string_returned += counter_attack(defencer)
      elsif luckily > 0.7
        string_returned += "..missing."
      else
        defencer.hp -= 8
        string_returned += "Oh yes, he takes the body cross. Catched him like a kid."
      end
    end

    def right_body_hook(defencer)
      string_returned = ""
      luckily = rand
      if defencer.skill_ids.include? 17
        string_returned += "#{defencer.first_name} is blocking the hook."
        string_returned += counter_attack(defencer)
      elsif luckily > 0.7
        string_returned += "Missed."
      else
        defencer.hp -= 15
        string_returned += "He catched him."
      end
    end

    def counter_attack(defencer)
      if defencer.skill_ids.include? 20
        if rand > 0.7
          "#{defencer.last_name} takes a counter attack but he is missing."
        else
          @fighter.hp -= 20
          "#{defencer.last_name} takes a counter attack and it finds its way. What a shot!!!"
        end
      else
        "Boxers are getting back to distance."
      end
    end
end
