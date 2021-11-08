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
    # @can_they  = nil
  end

  def add_supply(supply, amount_of_supply)
    @supplies[supply] += amount_of_supply
  end

  def can_build?(craft)
    craft.supplies_required.map do |supply, count|
      if @supplies.keys.include?(supply) && @supplies[supply] >= count
        bool == true
      end
     end
  end
end
