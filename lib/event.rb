require 'pry'
class Event
  attr_reader :name, :crafts, :attendees
  def initialize(name, crafts, attendees)
    @name = name
    @crafts = crafts
    @attendees = attendees
  end

  def attendee_names
    @attendees.map(&:name)
  end

  def craft_with_most_supplies
    # total_supplies = Hash.new { |h, k| h[k] = 0 }
    # @crafts.each do |craft|
    #   craft.supplies_required.sum do |supply|
    #     total_supplies[craft] += supply[1]
    #   end
    # end
    # return total_supplies
    a = @crafts.max_by{|craft| craft.supplies_required.length}.name
  end

  def supply_list
    a = @crafts.map {|craft| craft.supplies_required.keys}.flatten
    a.map(&:to_s)
  end

end
