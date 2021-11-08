class Event
  attr_reader :name,
              :crafts,
              :event

  def initialize(name, crafts, attendees)
    @name = name
    @crafts = crafts
    @attendees = attendees
  end

end
