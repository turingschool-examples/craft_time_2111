require 'pry'

class Craft
  attr_reader :data, :supplies

  def initialize(data, supplies)
    @data = data
    @supplies = supplies
  end
end
