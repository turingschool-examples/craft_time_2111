class Person
  attr_reader :name, :interests, :supplies
  def initialize(attributes)
    @name = attributes[:name]
    @interests = attributes[:interests]
    @supplies = {}
  end

  def add_supply(supply_name, amount)
    @supplies[supply_name] ||= 0
    @supplies[supply_name] += amount
  end
end
