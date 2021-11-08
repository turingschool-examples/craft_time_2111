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
    supplies_per_craft = []

    @crafts.each do |craft|
      supplies_per_craft << craft.required_supplies.keys.size
    end

    most_supplies = supplies_per_craft.max

    craft_with_most_supplies = supplies_per_craft.rindex(most_supplies)

    craft_name = @crafts[craft_with_most_supplies].name
  end

  def supply_list
    # Get all keys from all crafts
    all_craft_supplies = @crafts.map do |craft|
      craft.required_supplies.keys
    end
    # Flatten and find unique keys
    all_craft_supplies = all_craft_supplies.uniq.flatten
    # Turn flattened/unique keys into string
    supply_list = all_craft_supplies.map do |key|
      key.to_s
    end
    # Return string supply list (double check for copies)
    supply_list = supply_list.uniq
  end
end
