class Event
  attr_reader :name,
              :crafts,
              :attendees

  def initialize(name, crafts, person)
    @name = name
    @crafts = crafts
    @attendees = person
  end

  def attendee_names
    @attendees.map do |attendee|
      attendee.name
    end
  end

  def craft_with_most_supplies
    craft_most_supplies = @crafts.max_by do |craft|
      craft.supplies_required.size
    end
    craft_most_supplies.name
  end

  def supply_list
    all_supplies = @crafts.flat_map do |craft|
      craft.supplies_required.keys
    end

    all_supplies.map do |supply|
      supply.to_s
    end.uniq
  end

  def attendees_interested_in_certain_craft(craft)
    @attendees.find_all do |attendee|
      attendee.interests.include?(craft.name)
    end
  end

  def attendees_by_craft_interest
    attendes_interest = {}
      @crafts.each do |craft|
        attendes_interest[craft.name] = attendees_interested_in_certain_craft(craft)
      end
    attendes_interest
  end

  def crafts_that_use(supply)
    @crafts.find_all do |craft|
      craft.supplies_required.has_key?(supply.to_sym)
    end
  end
end
