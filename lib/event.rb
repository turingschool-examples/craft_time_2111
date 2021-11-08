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

  def attendees_by_craft_interest
    craft_hash = Hash.new
    @crafts.each do |craft|
      craft_hash[craft] = []
      @attendees.each do |person|
        if person.interests.include?(craft.name)
          craft_hash[craft].push(person)
        end
      end
    end
    craft_hash
  end

  def crafts_that_use(item)
    @crafts.select{ |craft| craft.supplies_required.keys == (item.to_sym)}
  end
end
