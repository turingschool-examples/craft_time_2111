class Event
  attr_reader :name, :crafts, :attendees

  def initialize(name, crafts, attendees)
    @name = name
    @crafts = crafts
    @attendees = attendees
  end

  def craft_with_most_supplies
    @crafts.max_by { |craft| craft.supplies_required.values.count}
  end

  def supply_list

    supply_keys = []
    @crafts.each do |craft|
      supply_keys.push(craft.supplies_required.keys)
    end
    supply_keys.flatten
  end
end
