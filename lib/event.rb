require './lib/craft'
require './lib/person'
require 'pry'

class Event < Craft
  attr_reader :name, :crafts, :attendees

  def initialize(name, craft, person)
    @name = name
    super(@craft, @person)
  end
end
