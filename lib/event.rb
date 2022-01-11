class Event
attr_reader :name, :crafts, :attendees

  def initialize(name, crafts, attendees)
    @name = name
    @crafts = crafts
    @attendees = attendees
  end

  def attendee_names
    @attendees.map do |attendee|
      # require "pry"; binding.pry
      attendee.name
    end
  end

  def craft_with_most_supplies
    supply = @crafts.find do |craft|
      # require "pry"; binding.pry
      craft.supplies_required.length

    end
    supply .name
    
  end
end
