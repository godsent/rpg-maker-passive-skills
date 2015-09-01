class Game_Enemy
  def passive_skills_states
    if respond_to? :skills
      super
    else
      skill_states begin 
        enemy.actions.map { |a| $data_skills[a.skill_id] }.select(&:passive?)
      end
    end
  end
end