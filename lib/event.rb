class Event

  attr_reader :name, :crafts, :attendees

  def initialize(name, crafts, attendees)
    @name = name
    @crafts = crafts
    @attendees = attendees
  end

  def attendee_names
    attendee_names = []
    @attendees.each do |attendee|
      # require "pry"; binding.pry
      attendee_names << attendee.name
    end
    attendee_names
  end

  def craft_with_most_supplies
    craft_supply_count = {}
    @crafts.each do |craft|
      craft_supply_count[craft] = craft.supplies_required.count
    end
    craft_supply_count.max_by{|craft, count| count}[0].name
  end

  def supply_list
    supply_list = []
    supply_list_strings = []
    @crafts.each do |craft|
        supply_list << craft.supplies_required.keys
    end
    supply_list.flatten!
    supply_list.uniq!
    supply_list.each do |supply|
      supply_list_strings << supply.to_s
    end
    supply_list_strings
  end

  def attendees_by_craft_interest

  end 

end
