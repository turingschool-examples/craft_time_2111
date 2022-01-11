class Event
  attr_reader :name, :crafts, :attendees

  def initialize(name, crafts, attendees)
    @name = name
    @crafts = crafts
    @attendees = attendees
  end

  def craft_with_most_supplies
    ordered = @crafts.sort_by do |craft|
      craft.supplies_required.size
    end
    ordered[-1].name
  end

  
end
