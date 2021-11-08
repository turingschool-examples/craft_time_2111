class Person
  attr_reader :name,
              :interests,
              :supplies

  def initialize(info)
    @name = info[:name]
    @interests = info[:interests]
    @supplies = {}
  end

  def add_supply(supply, count)
    @supplies[supply] = count
  end
end
