require 'pry'
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
     max_craft = @crafts.max_by do |craft|
      craft.supplies_required.count
    end
    max_craft.name
  end

  def supply_list
    list = @crafts.flat_map do |craft|
      craft.supplies_required.keys
    end
    list.map do |name|
      name.to_s
    end.uniq
    #binding.pry
  end
end
