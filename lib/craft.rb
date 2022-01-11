require 'pry'

class Craft
  attr_reader :data, :supplies

  def initialize(data, supplies)
    @data = data
    @supplies = supplies
  end

  def name # feel like this should be read by parent class
    @data
  end

  def supplies_required
    @supplies
  end
end
