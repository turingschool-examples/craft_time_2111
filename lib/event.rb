class Event
  attr_reader :name, :crafts, :attendees
  def initialize(name, crafts, attendees)
    @name = name
    @crafts = crafts
    @attendees= attendees
  end

  def attendee_names
    @attendees.map do |attendee|
      attendee.name
    end
  end

  def craft_with_most_supplies
    max_supplies = 0
    max_supply_craft = nil
    @crafts.each do |craft|
      if craft.supplies_required.values.sum > max_supplies
        max_supplies = craft.supplies_required.values.sum
        max_supply_craft = craft.name
      else
      end
    end
    max_supply_craft
  end

  def supply_list
    list_of_supplies = []
    @crafts.each do |craft|
      require "pry"; binding.pry
      list_of_supplies << craft.supplies_required.key
    end.uniq
  end
end
