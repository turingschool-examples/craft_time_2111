class Event

  attr_reader :name, :crafts, :attendees

  def initialize(event_name, crafts_array, persons_array)
    @name = event_name
    @crafts = crafts_array
    @attendees = persons_array
  end

  def attendee_names
    attendee_name_array = @attendees.map do |attendee|
      attendee.name
    end

    attendee_name_array
  end

  def craft_with_most_supplies
    craft_supplies = []
    @crafts.each do |craft|
      craft_supplies << craft.supplies_required.keys.size
    end
    most_supplies = craft_supplies.max
    craft_with_most_supplies = craft_supplies.rindex(most_supplies)
    craft_name = @crafts[craft_with_most_supplies].name
  end

  def supply_list
    supply_list = []
    supply_list_strings = []
    @crafts.each do |craft|
      supply_list << craft.supplies_required.keys
    end
    supply_list.flatten!
    supply_list.uniq!
    supply_list.each do |supply|
      supply_list_strings << supply.to_s
    end
    supply_list_strings
    # binding.pry
  end

  def attendees_by_craft_interest
    person_craft = {}
    @crafts.each do |craft|
      if !person_craft.has_key?(craft.name)
        person_craft[craft.name] = []
      end
      binding.pry
    end

  end
end
