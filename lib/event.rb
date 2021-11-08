class Event
  attr_reader :name, :crafts, :attendees

  def initialize(name, crafts, attendees)
    @name = name
    @crafts = crafts
    @attendees = attendees
  end

  def attendee_names
    attendee_names = @attendees.map{|attendee| attendee.name}
  end

  def craft_with_most_supplies
    @crafts.max_by{|craft|craft.supplies_required.keys.count}.name
  end

  def supply_list

    crafts = @crafts.flat_map{|craft| craft.supplies_required.keys}
    crafts.uniq!.map{|name| name.to_s}
  end
end
