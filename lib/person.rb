class Person
  attr_reader :supplies
  def initialize(info)
    @info = info
    @supplies = {}
  end

  def name
    @info[:name]
  end

  def interests
    @info[:interests]
  end

  def add_supply(supply, count)

    @supplies[supply]
    @supplies[supply] = count
  end
end
#require "pry"; binding.pry
