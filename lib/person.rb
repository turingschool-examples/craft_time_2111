require './lib/craft'
require './lib/event'


class Person
  attr_reader :name,
              :interests,
              :supplies

  def initialize(info)
    @name      = info[:name]
    @interests = info[:interests]
    @supplies  = Hash.new(0)
    @can_they  = nil
  end

  def add_supply(supply, amount_of_supply)
    @supplies[supply] += amount_of_supply
  end

  def can_build?(craft)
    craft_hash = craft.supplies_required
    require "pry"; binding.pry
  end
end
