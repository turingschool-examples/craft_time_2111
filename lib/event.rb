class Event
  attr_reader :name,
              :crafts,
              :attendees

  def initialize(name, crafts, attendees)
    @name          = name
    @crafts        = crafts.first
    @attendees     = attendees
  end

  def attendee_names
    @attendees.map do |attendee|

      require "pry"; binding.pry
    end
  end
end