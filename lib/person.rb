class Person

  attr_reader :name,
              :interests,
              :supplies

  def initialize(person_data)
    @name = person_data[:name]
    @interests = person_data[:interests]
    @supplies = Hash.new(0)
  end

  def add_supply(supply, amount)
    @supplies[supply] += amount 
  end

end
