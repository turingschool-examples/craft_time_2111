require 'pry'
class Event < Craft
  attr_reader :name, :crafts, :attendees

  def initialize(name, crafts, person)
    @name = name
    @crafts = crafts
    @attendees = person
  end

end
