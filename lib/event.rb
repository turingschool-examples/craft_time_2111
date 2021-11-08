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
    @crafts.max_by do |craft|
      craft.supplies_required.keys.count
    end
  end

  def supply_list
    supplies = []
    @crafts.each do |craft|
      supplies.push(craft.supplies_required.keys)
    end
      supplies.flatten.uniq.map do |supply|
        supply.to_s
    end
  end

end
