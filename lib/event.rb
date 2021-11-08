require './lib/craft'
require './lib/person'

class Event

  attr_reader :name, :crafts, :attendees

  def initialize(event_name, crafts, attendees)
    @name = event_name
    @crafts = crafts
    @attendees = attendees
  end

  def attendee_names
    @attendees.map { |attendee| attendee.name }
  end

  def craft_with_most_supplies
    @crafts.max_by { |craft| craft.supplies_required.length }.name
  end

  def supply_list
    supply_list = crafts.flat_map { |craft| craft.supplies_required.keys }.uniq
    supply_list = supply_list.map { |supply| supply.to_s }
  end

end
