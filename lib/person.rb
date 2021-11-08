class Person
  attr_reader :name,
              :interests,
              :supplies
  def initialize(bio)
    @name = bio[:name]
    @interests = bio[:interests]
    @supplies = {}
  end

  # take the first arg and assign it to hash key
  # take the second arg and assign it to value
  def add_supply(supply, amount)
    supplies[supply] = amount
  end

  
end
