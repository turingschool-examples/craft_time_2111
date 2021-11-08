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

  # well now we are adding existing supplies.
  # check if key already exists, then add amount
  # to existing amount. 
  def add_supply(supply, amount)
    if supplies.has_key?(supply)
      supplies[supply] += amount
      require "pry"; binding.pry
    else
      supplies[supply] = amount
    end
  end


end
