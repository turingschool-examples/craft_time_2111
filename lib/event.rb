class Event
  attr_reader :name, :crafts, :attendees

  def initialize(name, crafts, attendees)
    @name = name
    @crafts = crafts
    @attendees = attendees
  end

  def attendee_names
    @attendees.map {|person| person.name}
  end

  def craft_with_most_supplies
    @crafts.max_by {|craft| craft.supplies_required.count}.name
  end
end
