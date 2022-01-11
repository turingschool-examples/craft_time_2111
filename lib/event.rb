class Event
  attr_reader :name, :crafts, :attendees
  def initialize(name, crafts, attendees)
    @name = name
    @crafts = crafts
    @attendees = attendees
  end

  def craft_with_most_supplies
    number_of_supplies = 0
    craft_with_most_supplies = nil
    @crafts.each do |craft|

      if craft.supplies_required.length > number_of_supplies
        craft_with_most_supplies = craft.name
      end
      number_of_supplies = craft.supplies_required.length
    end
    return craft_with_most_supplies
  end

  def supply_list
    supplies = []
    @crafts.each do |craft|
      craft.supplies_required.each do |supply|
        supplies << supply[0].to_s
      end
    end
    #require "pry"; binding.pry
    return supplies.uniq
  end
end
