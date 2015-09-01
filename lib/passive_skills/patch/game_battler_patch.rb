class Game_Battler
  def feature_objects
    super + passive_skills_states
  end

  private 

  def skill_states(skills)
    skills.map do |skill|
      skill.effects.select { |effect| effect.code == 21 }.map do  |effect|
        $data_states[effect.data_id]
      end
    end.flatten
  end

  def passive_skills_states
    return [] if @do_not_look_in_passive
    @do_not_look_in_passive = true
    all_skills = skills
    @do_not_look_in_passive = false
    skill_states all_skills.select(&:passive?)
  end
end