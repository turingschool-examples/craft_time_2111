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

end
