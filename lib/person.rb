class Person
  attr_accessor :name, :interests, :supplies

  def initialize(attributes)
    @name = attributes[:name]
    @interests = attributes[:interests]
    @supplies = Hash.new(0)
  end

  def add_supply(supply, quantity)
    @supplies[supply] += quantity
  end
end
