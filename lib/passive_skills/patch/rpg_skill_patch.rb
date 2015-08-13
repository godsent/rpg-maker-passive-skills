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