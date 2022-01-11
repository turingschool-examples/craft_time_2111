class Person
  attr_reader :name, :interests, :supplies

  def initialize(attributes)
    @name = attributes[:name]
    @interests = attributes[:interests]
    @supplies = Hash.new(0)
  end

  def add_supply(name, count)
    supplies[name] += count
  end
end
