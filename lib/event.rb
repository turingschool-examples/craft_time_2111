class Event

  attr_reader :name, :crafts, :attendees

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
    supplies_required = 0
    craft_with_most_supplies = nil
    @crafts.each do |craft|
      if craft.supplies_required.count > supplies_required
        (supplies_required = craft.supplies_required.count) && (craft_with_most_supplies = craft.name)
      end
    end
    craft_with_most_supplies
  end

  def supply_list
    supply_list = []
    @crafts.each do |craft|
      craft.supplies_required.each_key do |item|
        supply_list.include?(item) ? next : supply_list << item.to_s
      end
    end
    supply_list
  end


end
