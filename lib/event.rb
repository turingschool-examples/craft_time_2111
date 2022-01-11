require './lib/craft'
require './lib/person'

class Event
  attr_reader :name, :craft, :attendees
  attr_accessor :crafts, :attendees
  def initialize(name, craft, person)
    @name = name
    @crafts = craft
    @attendees = person
  end

  def attendee_names
    names = []
    attendees.each do |person|
      names << person.name
    end
    names
  end

  def craft_with_most_supplies
    desired = crafts.max_by do |craft|
      craft.supplies_required.count
    end
    desired.name
  end

  def supply_list
    result = crafts.flat_map do |craft|
      craft.supplies_required.flat_map do |supply|
        supply.first.to_s
      end
    end
    result.uniq
  end

  # def can_build?(craft)
  #   require "pry"; binding.pry
  # end
end
