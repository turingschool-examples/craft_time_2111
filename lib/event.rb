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
    @attendees.map {|attendee| attendee.name}
  end

  def craft_with_most_supplies
    craft_with_most_supplies = ""
    craft_supplies_length = 0
    @crafts.each do |craft|
      if craft.supplies_required.length > craft_supplies_length
        craft_supplies_length = craft.supplies_required.length
        craft_with_most_supplies = craft.name
      end
    end
    craft_with_most_supplies
  end

  def supply_list
    supply_list = []
    @crafts.each do |craft|
      craft.supplies_required.keys.each do |key|
        supply_list << key.to_s
      end
    end
    supply_list.uniq
  end

end
