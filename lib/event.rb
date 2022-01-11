class Event
  attr_reader :name,
              :crafts,
              :attendees

  def initialize(name, craft, person)
    @name = name
    @craft = craft
    # @person = person
    @attendees = person
  end

  def crafts
  end

  # def attendees
  # end

end
