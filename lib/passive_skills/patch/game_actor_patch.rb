class Game_Actor
  def passive_skills_states
    return [] if @do_not_look_in_passive
    @do_not_look_in_passive = true
    all_skills = skills
    @do_not_look_in_passive = false
    skill_states all_skills.select(&:passive?)
  end
end