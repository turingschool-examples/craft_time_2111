class Event
  attr_reader :name,
              :crafts,
              :attendees

  def initialize(name, crafts, person)
    @name = name
    @crafts = crafts
    @attendees = person
  end

  def attendee_names
    @attendees.map do |attendee|
      attendee.name
    end
  end

  def craft_with_most_supplies
    craft_most_supplies = @crafts.max_by do |craft|
      craft.supplies_required.size
    end
    craft_most_supplies.name
  end

  def supply_list
    all_supplies = @crafts.flat_map do |craft|
      craft.supplies_required.keys
    end
    
    all_supplies.map do |supply|
      supply.to_s
    end.uniq
  end
end
