class Person
  attr_reader :name, :interests, :supplies
  def initialize(name_and_interests)
    @name = name_and_interests[:name]
    @interests = name_and_interests[:interests]
    @supplies = {}
  end

  def add_supply(supply, quantity)
    new_supplies = {}
    new_supplies[supply] = quantity
    @supplies = new_supplies.merge(@supplies){|key, value_1, value_2| value_1 + value_2}
  end
end
