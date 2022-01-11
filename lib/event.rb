class Event
  attr_reader :name, :crafts, :attendees
  def initialize(name, crafts, attendees)
    @name = name
    @crafts = crafts
    @attendees = attendees
  end

  def attendee_names
    @attendees.map {|attendee| attendee.name}
  end

  def craft_with_most_supplies
    craft_hash = {}
    @crafts.each do |craft|
      craft_hash[craft.name] = craft.supplies.keys.length
    end
    craft_hash.key(craft_hash.values.max)
  end

  def supply_list
    supplies = @crafts.reduce([]) do |array, craft|
      array << craft.supplies.keys
      array
    end
    supply_strings = supplies.flatten.uniq!.map {|supply| supply.to_s}
  end

  def attendees_by_craft_interest
    interest_hash = Hash.new { |hash, key| hash[key] = [] }
    @crafts.each {|craft| interest_hash[craft.name] = [] }
    @crafts.each do |craft|
      @attendees.each do |person|
        interest_hash[craft.name] << person if person.interests.include?(craft.name)
      end
    end
    interest_hash
  end

  def crafts_that_use(tool)
    crafts = []
    @crafts.each do |craft|
      crafts << craft if craft.supplies.keys.include?(tool.to_sym)
    end
    crafts
  end

  def assign_attendees_to_crafts
    attendees_by_craft = Hash.new { |hash, key| hash[key] = [] }
    @crafts.each {|craft| attendees_by_craft[craft] = [] }
    @attendees.each do |person|
      @crafts.each do |craft|
        attendees_by_craft[craft] << person if person.can_build?(craft) == true
      end
    end
    random_attendees = Hash.new { |hash, key| hash[key] = [] }
    attendees_by_craft.each_pair do |craft, attendees|
      random_attendees[craft] = attendees.sample
    end
    random_attendees
  end
end
