class Event
  attr_reader :name, :crafts, :attendees
  def initialize(name, crafts, attendees)
    @name = name
    @crafts = crafts
    @attendees= attendees
  end

  def attendee_names
    @attendees.map do |attendee|
      attendee.name
    end
  end

  def craft_with_most_supplies
    max_supplies = 0
    max_supply_craft = nil
    @crafts.each do |craft|
      if craft.supplies_required.values.sum > max_supplies
        max_supplies = craft.supplies_required.values.sum
        max_supply_craft = craft.name
      else
      end
    end
    max_supply_craft
  end

  def supply_list
    list_of_supplies = []
    @crafts.each do |craft|
      craft.supplies_required.each do |k, v|
        list_of_supplies << k.to_s
      end
    end
    list_of_supplies.uniq
  end

  def attendees_by_craft_interest
    craft_interest_hash = {}
    @crafts.map do |craft|
      require "pry"; binding.pry
      craft_interest_hash[craft.name] = @attendees.select { |attendee| attendees.interest == craft.name}
    end
    craft_interest_hash
  end

  def crafts_that_use(object)
    crafts_with_object = @attendees.select { |attendee| attendee.interests.name == object}
    crafts_with_object.map do |craft|
      @attendees.select do |attendee|
        attendee.name
      end
    end.flatten
  end
end
