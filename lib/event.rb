require 'pry'

class Event
  # binding.pry
  attr_reader :name, :craft, :person

  def initialize(name, craft, person)
    @name = name
    @craft = craft
    @person = person
  end

  def crafts
    @event.values[1]
  end
end
