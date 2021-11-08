class Event

  attr_reader :name, :crafts, :attendees

  def initialize(name, craft, attendees)
    @name = name
    @crafts = craft
    @attendees = attendees
  end

end
