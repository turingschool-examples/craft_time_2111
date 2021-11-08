class Event
  attr_accessor :name, :crafts, :attendees

  def initialize(name, crafts, attendees)
    @name = name
    @crafts = crafts
    @attendees = attendees
    @supplies = {}
  end

  def add_supply(supply, quantity)
    @supplies[supply] = quantity
  end

  def attendee_names
    names = @attendees.map { |attendee| attendee.name }
  end

  def craft_with_most_supplies
     result = @crafts.max_by do |craft|
       craft.supplies_required.size
     end
     result.name
  end

  def supply_list
  end

end
