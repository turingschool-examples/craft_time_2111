class Event
  attr_reader :name, :crafts, :attendees

  def initialize(name, crafts, attendees)
    @name = name
    @crafts = crafts
    @attendees = attendees
  end

  def craft_with_most_supplies
    @crafts.max_by do |craft|
      craft.supplies_required.count
    end
  end

  def supply_list
  list = (@crafts.flat_map { |craft| craft.supplies_required.keys  }).uniq
  list.map { |supply| supply.to_s  }
  end
end
