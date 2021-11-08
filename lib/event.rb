class Event
  attr_reader :name, :crafts, :person
  def initialize(name, crafts, person)
    @name = name
    @crafts = [crafts]
    @person= [person]
  end

  def attendee_names
    [person.name]
  end
end
