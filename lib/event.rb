require './lib/craft'
class Event
  attr_accessor :craft, :attendees, :name

  def initialize(name, _craft, _person)
    @name = name
    @craft = Craft
    @attendees = Person
  end
end
