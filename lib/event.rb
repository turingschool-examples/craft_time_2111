class Event
  attr_reader :name, :crafts, :attendees

  def initialize(name, crafts, person)
    @name = name
    @crafts = crafts
    @attendees = person
  end

  def attendee_names
    names = []
    @attendees.each do |person|
      # binding.pry
      names << person.name
      # binding.pry
    end
    names
  end
end
