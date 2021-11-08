require './lib/craft'

class Person

  attr_reader :name, :interests, :supplies

  def initialize(data)
    @name = data[:name]
    @interests = data[:interests]
    @supplies = {}
  end

  def add_supply(supply_name, count)
    @supplies[supply_name] ||= 0
    @supplies[supply_name] += count
  end

end
