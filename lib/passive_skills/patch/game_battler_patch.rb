class Game_Battler
  def feature_objects
    super + passive_skills_states
  end

  def skill_states(skills)
    skills.map do |skill|
      skill.effects.select { |effect| effect.code == 21 }.map do  |effect|
        $data_states[effect.data_id]
      end
    end.flatten
  end
end