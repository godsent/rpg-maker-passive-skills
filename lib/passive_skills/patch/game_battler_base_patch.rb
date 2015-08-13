class Game_BattlerBase
  alias usable_for_passive_skills? usable?
  def usable?(item)
    return false if item.respond_to?(:passive?) && item.passive?
    usable_for_passive_skills? item
  end
end