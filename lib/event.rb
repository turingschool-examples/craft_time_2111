class Event
  attr_reader :name, :crafts, :attendees

  def initialize(name, crafts, person)
    @name = name
    @crafts = crafts
    @person = person
  end
end
