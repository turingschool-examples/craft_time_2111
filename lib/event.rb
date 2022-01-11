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
    # require "pry"; binding.pry
  end
end
