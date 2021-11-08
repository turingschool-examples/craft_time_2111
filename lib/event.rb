require './lib/craft'
require './lib/person'

class Event

  attr_reader :name, :crafts, :attendees

  def initialize(event_name, crafts, attendees)
    @name = event_name
    @crafts = crafts
    @attendees = attendees
  end

end
