class Event
  attr_reader :name, :attendees
  attr_accessor :crafts
  def initialize(name, crafts, attendees)
    @name = name
    @crafts = []
    @attendees = []
  end

  def add_craft(craft)
    @crafts << craft
end

def add_attendees(attendee)
  @attendees << attendee
end
end
