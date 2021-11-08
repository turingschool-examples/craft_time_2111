class Person
  attr_reader :name, :interests, :supplies

  def initialize(data)
    @name = data[:name]
    @interests = data[:interests]
    @supplies = {}
  end

  def add_supply(supply)
    new_hash = {}
    supply.map do  |key, value|
      new_hash[key] = value
    end
    new_hash.map do |key , value|
      @supplies[key] = value += value
    end 
  end
end
