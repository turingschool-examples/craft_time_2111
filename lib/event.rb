class Event
  attr_reader :name, :crafts, :attendees

  def initialize(name, crafts, attendees)
    @name = name
    @crafts = crafts
    @attendees = attendees
  end

  def attendee_names
    arr = []
    @attendees.each do |person|
      arr << person.name
    end
    arr
  end

  def craft_with_most_supplies #returns craft object name with most keys and hashes
    arr = []
    @crafts.each do |craft|
      arr << craft.supplies_required.length
    end
    arr.max
  end
end
