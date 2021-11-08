class Event

  attr_reader :name,
              :crafts,
              :attendees

  def initialize(name, craft, attendees)
    @name = name
    @crafts = craft
    @attendees = attendees
  end

  def attendee_names
    names = []
    @attendees.each do |attendee|
      names.append(attendee.name)
    end
    names
  end

  def craft_with_most_supplies
    supply_count = Hash.new
    @crafts.each do |craft|
      supply_count[craft.name] = craft.supplies_required.count
    end
    supply_count.key(supply_count.values.max)
  end


end
