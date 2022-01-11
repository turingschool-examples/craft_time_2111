class Person
attr_reader :name, :interests, :supplies

  def initialize(attributes)
    @name = attributes[:name]
    @interests = attributes[:interests]
    @supplies = {}
  end

  def add_supply(supply, amount)
    if @supplies[supply].nil?
    @supplies[supply] = amount
    # require "pry"; binding.pry
    else
    @supplies[supply] += amount
    end
  end
end
