class Event
  attr_reader :name,
              :crafts,
              :attendees

  def initialize(name, craft, attendee)
    @name = name
    @crafts = [craft].flatten
    @attendees = [attendee].flatten
  end
end
