class Event
  attr_accessor :name, :crafts, :attendees

  def initialize(name, crafts, attendees)
    @name = name
    @crafts = crafts
    @attendees = attendees
  end

  def attendee_names
    names = @attendees.collect do |attendee|
      attendee.name
    end

    names
  end

  def craft_with_most_supplies
    supply_count = {}
    @crafts.each do |craft|
      supply_count[craft.name] = craft.supplies_required.count
    end
    supply_count.key(supply_count.values.max)
  end

  def get_craft_supplies(craft)
    supplies_required = craft.supplies_required.keys
    supplies_required = supplies_required.map { |supply| supply.to_s }

  end

  def supply_list
    supplies = []
    @crafts.each do |craft|
      supplies << get_craft_supplies(craft)
    end

    supplies.flatten.uniq
  end


  # require 'pry'; binding.pry
end
