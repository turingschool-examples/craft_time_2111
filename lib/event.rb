require './lib/person'
require './lib/craft'

class Event
  attr_reader :name,
              :crafts,
              :attendees

  def initialize(name, crafts, attendees)
    @name      = name
    @crafts    = crafts
    @attendees = attendees
  end

  def attendee_names
    @attendees.map do |attendee|
      attendee.name
    end
  end


  def craft_with_most_supplies
    @crafts.max do |craft|
      craft.amount_of_supplies
    end.name
  end

  def supply_list
    list = []
    @crafts.each do |craft|
      craft.supplies_required.each do |supply|
        list << supply[0].to_s
      end
    end
    list.uniq
  end


end
