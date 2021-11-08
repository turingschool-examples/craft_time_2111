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

  def supply_list
    all_craft_supplies = @crafts.map do |craft|
      craft.required_supplies.keys
    end

    all_craft_supplies = all_craft_supplies.uniq.flatten

    supply_list = all_craft_supplies.map do |key|
      key.to_s
    end

    supply_list = supply_list.uniq
  end
end
