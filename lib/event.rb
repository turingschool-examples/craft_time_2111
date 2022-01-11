class Event
  attr_reader :name, :crafts, :attendees

  def initialize(name, crafts, attendees)
    @name = name
    @crafts = crafts
    @attendees = attendees
  end

  def craft_with_most_supplies
    ordered = @crafts.sort_by do |craft|
      craft.supplies_required.size
    end
    ordered[-1].name
  end

  def supply_list
    @crafts.flat_map do |craft|
      craft.supplies_required.map do |supply, num|
        "#{supply}"
      end
    end.uniq
  end

  def attendees_by_craft_interest
    @crafts.reduce({}) do |acc, craft|
      acc[craft.name] = @attendees.select do |person|
        person.interests.include?(craft.name)
      end
    acc
    end
  end

  def crafts_that_use(supply)
    @crafts.select do |craft|
      craft.supplies_required.keys.to_s.include?(supply)
    end
  end
end
