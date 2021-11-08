require './lib/person'
#

#
#
#
class Event

  attr_reader :name, :crafts, :attendees

  def initialize(name, crafts, attendees)
    @name = name
    @crafts = crafts
    @attendees = attendees
  end

  def attendee_names
    names = []
    @attendees.each do |attendee|
      names << attendee.name
    end
    names
  end

  def craft_with_most_supplies
    match = @crafts.max_by { |craft| craft.supplies_required.keys.count }
    match = match.name
    match
  end

  def supply_list
    supply_array = []
    @crafts.each do |craft|
      craft.supplies_required.each_pair do |supply, quantity|
        supply_array << supply.to_s if !supply_array.include?(supply.to_s)
      end
    end
    supply_array
  end

  def attendees_by_craft_interest
    grouped_by_interest = {}
    @crafts.each do |craft|
      grouped_by_interest[craft.name] ||= []
      @attendees.each do |attendee|
        if attendee.interests.include?(craft.name)
          grouped_by_interest[craft.name] << attendee
        end
      end
    end
    grouped_by_interest
  end

  def crafts_that_use(item)
    crafts_array = []
    @crafts.each do |craft|
      if craft.supplies_required.keys.include?(item)
        crafts_array << item
      end
    end
    crafts_array
  end



  end
