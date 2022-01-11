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

  def can_build?(craft)
    craft.supplies_required.map do |key, value|
       require "pry"; binding.pry
    end
  end
end
