class Event
  attr_reader :name, :crafts, :attendees

  def initialize(name, craft, person)
    @name = name
    @crafts = []
    @attendees = []

    @crafts << craft
    @attendees << person
  end

  def attendee_names
    @attendees
  end
end
