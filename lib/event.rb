require 'pry'
class Event
  attr_reader :name, :crafts, :attendees

  def initialize(name, craft, attendee)
    @name = name
    @crafts = craft
    @attendees= attendee
  end

  def attendees_name
    @attendees.map do |attendee|
      attendee.name
    end
  end

  def craft_with_most_supplies
    most_sup_craft = @crafts.select do |craft|
      craft.supplies_required.size
    end
    most_sup_craft.first.name
  end

  def supply_list
    keys = @crafts.flat_map do |craft|
      craft.supplies_required.keys
    end
    keys.map do |key|
      key.to_s
    end.uniq
  end

end
