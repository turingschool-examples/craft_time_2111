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
      craft.supplies_required.size
    end.name
  end

  def supply_list
    @crafts.map do |craft|
      craft.supplies_required.keys.map do |key|
        key.to_s
      end
    end.flatten.uniq
  end

  def attendees_by_craft_interest
    craft_interest = Hash.new
    @crafts.each do |craft|
      if craft_interest[craft.name]
        craft_interest = []
      else
        craft_interest[craft.name] = @attendees.select {|a| a.name if a.interests.include?(craft.name)}
      end
    end
    craft_interest
  end

  def crafts_that_use(item)
    @crafts.find_all do |craft|
      craft.supplies_required.keys.to_s.include?(item)
    end
  end
end
