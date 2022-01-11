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

  def craft_with_most_supplies
    # this is not a good method. I am aware
    if @crafts[0].supplies_required.size > @crafts[1].supplies_required.size
      @crafts[0].name
    else
      @crafts[1].name
    end
  end
end
