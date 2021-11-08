require './lib/person'
require './lib/craft'

class Event
  attr_reader :name,
              :crafts,
              :attendees

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
    most = @crafts.max_by do |craft|
      craft.supplies_required.length
    end
    most.name
  end

  def supply_list
    string = @crafts.map do |craft|
      craft.supplies_required.keys
    end.flatten.uniq
    string.map do |craft|
      craft.to_s
    end
  end

  def attendees_by_craft_interest
    attendee_by_interest = {}
    @crafts.each do |craft|
      if attendee_by_interest.keys.include?(craft.name) == false
        attendee_by_interest[craft.name] = []
      end
      @attendees.each do |attendee|
        if attendee.interests.include?(craft.name)
          attendee_by_interest[craft.name] << attendee
        end
      end
    end
    attendee_by_interest
  end

  def crafts_that_use(supply)

  end
end
