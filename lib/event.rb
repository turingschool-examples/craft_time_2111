class Event
  attr_reader :name, :crafts, :attendees
  def initialize(name, crafts, attendees)
    @name = name
    @crafts = crafts
    @attendees = attendees
  end

  def attendee_names
    @attendees.map {|attendee| attendee.name}
  end

  def craft_with_most_supplies
    craft_hash = {}
    @crafts.each do |craft|
      craft_hash[craft.name] = craft.supplies.keys.length
    end
    craft_hash.key(craft_hash.values.max)
  end

  def supply_list
    supplies = @crafts.reduce([]) do |array, craft|
      array << craft.supplies.keys
      array
    end
    supply_strings = supplies.flatten.uniq!.map {|supply| supply.to_s}
  end
end
