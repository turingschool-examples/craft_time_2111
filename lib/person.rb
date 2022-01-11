class Person
  attr_reader :name, :interests, :supplies
  def initialize(data)
    @name = data[:name]
    @interests = data[:interests]
    @supplies = Hash.new(0)
  end

  def add_supply(supply, amount)
    @supplies[supply] += amount
  end

  def can_build?(craft)
  end
end
