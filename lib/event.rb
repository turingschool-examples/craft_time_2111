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


end
