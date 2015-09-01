#gems/passive_skills/lib/passive_skills.rb
module PassiveSkills
  VERSION = '0.0.2'
end

#gems/passive_skills/lib/passive_skills/patch.rb
module PassiveSkills::Patch
end

#gems/passive_skills/lib/passive_skills/patch/game_battler_patch.rb
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
#gems/passive_skills/lib/passive_skills/patch/game_enemy_patch.rb
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
#gems/passive_skills/lib/passive_skills/patch/rpg_skill_patch.rb
class RPG::Skill
  attr_writer :passive 

  def passive?
    @passive || passive_flag_from_note 
  end

  private 

  def passive_flag_from_note
    note.include? '<passive>'
  end
end
#gems/passive_skills/lib/passive_skills/patch/game_battler_base_patch.rb
class Game_BattlerBase
  alias usable_for_passive_skills? usable?
  def usable?(item)
    return false if item.respond_to?(:passive?) && item.passive?
    usable_for_passive_skills? item
  end
end
#gems/passive_skills/lib/passive_skills/patch/window_skill_list_patch.rb
class Window_SkillList
  alias draw_skill_cost_for_passive_skills draw_skill_cost 
  def draw_skill_cost(rect, skill)
    unless skill.passive?
      draw_skill_cost_for_passive_skills rect, skill 
    end
  end
end