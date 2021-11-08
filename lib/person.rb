class Person
  attr_reader :name, :interests, :supplies
  def initialize(name_interests)
    @name = name_interests[:name]
    @interests = name_interests[:interests]
    @supplies = {}
  end

  def add_supply(supply, quantity)
    @supplies[supply] = quantity
  end

  def can_build?
    false
  end 
end
