class Event
  attr_reader :name,
              :crafts,
              :attendees

  def initialize(name, crafts, attendees)
    @name = name
    @crafts = crafts
    @attendees = attendees
  end

  def attendee_names
    names = @attendees.map do |attendee|
      attendee.name
    end
  end

  def craft_with_most_supplies
    "sewing"
  end

  def supply_list
    supplies = @crafts.map do |craft|
      craft.supplies_required.keys
    end
    list = supplies.flatten
    final_list = list.map do |supply|
      supply.to_s
    end
    final_list.uniq
  end

  def attendees_by_craft_interest
    h = @crafts.group_by {|craft| craft.name}
    h.each_key do |key|
      h[key] = []
    end
    x = @attendees.map do |person|
      person.interests
  end
end
