class Event
  attr_accessor :name, :crafts, :attendees

  def initialize(name, crafts, attendees)
    @name = name
    @crafts = crafts
    @attendees = attendees
    @supplies = {}
  end

  def add_supply(supply, quantity)
    @supplies[supply] = quantity
  end

  def attendee_names
    names = @attendees.map { |attendee| attendee.name }
  end

end
