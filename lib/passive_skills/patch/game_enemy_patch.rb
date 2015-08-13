class Game_Enemy
  def passive_skills_states
    skill_states begin 
      if respond_to?(:skills)
        skills
      else
        enemy.actions.map { |a| $data_skills[a.skill_id] }
      end.select(&:passive?)
    end
  end
end