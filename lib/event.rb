class Event
  attr_reader :name, :crafts, :attendees
  def initialize(name, crafts, person)
    @name = name
    @crafts = []
    @attendees = []
  end

  def add_craft(craft)
    @crafts.push(craft)
  end

  def add_attendees(person)
    @attendees.push(person)
  end

  def attendee_names
    @attendees.map do |attendee|
      attendee.name
    end
  end

  def craft_with_most_supplies
    max = 0
    @crafts.select do |craft|
      if craft.supplies_required.size > max
        max = craft.supplies_required.size
        return craft.name
      end
    end
    max
  end

  def supply_list
    supply_array = []
    @crafts.flat_map do |craft|
      craft.supplies_required.keys.flat_map do |supply|
        supply_array << supply.to_s
        #require "pry"; binding.pry
      end     #supply_array << craft.supplies_required.keys.flatten
    end
    supply_array.uniq
  end

end
