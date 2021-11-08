class Event
  attr_reader :crafts, :attendees

  def initialize(name, [crafts], [attendees])
    @name = name
    @crafts = []
    @attendees = []
  end
end
