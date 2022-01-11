require 'pry'

class Event
  attr_reader :name, :crafts, :attendees

  def initialize(name, crafts = [], attendees = [])
    @name = name
    @crafts = crafts
    @attendees = attendees
  end

  def attendee_names
    @attendees.map do |attendee|
      attendee.name
    end
  end

  def craft_with_most_supplies
    craft = @crafts.max_by do |craft|
      craft.number_of_supplies
    end
    craft.name
  end

  def supply_list
    supplies_array = []
    supplies = @crafts.each do |craft|
      supplies_array << craft.supplies_required.keys
    end

    supplies_array.flatten.uniq.map do |supply|
      supply.to_s
    end

  end


end
