class Event
  attr_accessor :name, :crafts, :attendees

  def initialize(name, crafts, attendees)
    @name = name
    @crafts = crafts
    @attendees = attendees
    @supplies = {}
  end

  def add_supply(supply, quantity)
    @supplies[supply] = quantity
  end

  def attendee_names
    names = @attendees.map { |attendee| attendee.name }
  end

  def craft_with_most_supplies
     result = @crafts.max_by do |craft|
       craft.supplies_required.size
     end
     result.name
  end

  def supply_list
    list = []
    @crafts.map do |craft|
      craft.supplies_required.each_key do |supply|
        list << supply.to_s
      end
    end
    list.uniq
  end

  def can_build?(craft_type)
    has_enough = false
    @crafts.each do |craft|
      craft_type.supplies_required.each do |supply|
        has_enough = craft.supplies_required.has_key?(supply.first) && craft.supplies_required.values_at(supply.first).first >= supply[1] && craft_type.name == craft.name
        # require 'pry'; binding.pry
      end
      return has_enough
    end
  end

  def attendees_by_craft_interest
    supply_list do |supply|
      @attendees.each do |attendee|
        require 'pry'; binding.pry
      end
    end


  end


end
