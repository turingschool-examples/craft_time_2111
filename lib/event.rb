class Event #not inheritance because we can't pass craft or person up to event
  attr_reader :name
  attr_accessor :crafts,
                :attendees
  # if crafts should be a variable, we will need the above

  #crafts_with_most_supplies is clearly a class method

  def self.crafts
    #need a collector for instances of class, but where are instances stored?
    #cant be passed in according to interaction pattern, can't use a method to collect
  end

  def self.attendees

  end

  def initialize(name, craft, person)
    @name = name
    @crafts = craft
    @attendees = person
  end
end

#should I be writing class methods in Craft and Person to collect?
#seems to follow logically because I want to collect all instances of each
#and they are run there. But out of time now.
