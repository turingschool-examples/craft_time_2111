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
    # is it bad form to use both syntaxes in one method?
    string.map {|craft| craft.to_s}
  end
end
