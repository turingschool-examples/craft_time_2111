require './lib/craft'
require './lib/person'

class Event
  attr_reader :name, :craft, :attendees
  attr_accessor :crafts, :attendees
  def initialize(name, craft, person)
    @name = name
    @crafts = craft
    @attendees = person
  end
end
