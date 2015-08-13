class Window_SkillList
  alias draw_skill_cost_for_passive_skills draw_skill_cost 
  def draw_skill_cost(rect, skill)
    unless skill.passive?
      draw_skill_cost_for_passive_skills rect, skill 
    end
  end
end