class Person
  attr_reader :name, :interests, :supplies

  def initialize(person)
    @name = person[:name]
    @interests = person[:interests]
    @supplies = {}
  end

  def add_supply(name, quantity)
    @supplies[name]= quantity
  end
end
