require './lib/person'
require './lib/craft'

class Event
  attr_reader :name, :crafts, :attendees

  def initialize(name, crafts, attendees)
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
    @crafts.max_by do |craft|
      craft.supplies_required.length
    end.name
  end

  def supplies_list
    supplies = @crafts.flat_map do |craft|
      craft.supplies_required.keys
    end.uniq

    supplies.map do |supply|
      supply.to_s
    end
  end
end
