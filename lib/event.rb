class Event
  attr_reader :name,
              :crafts,
              :attendees

  def initialize(name, craft, person)
    @name = name
    @crafts = craft
    @attendees = person
  end

  def attendee_names
    names = []
    @attendees.map do |person|
      names << person.name
  end.uniq.flatten
end


end
