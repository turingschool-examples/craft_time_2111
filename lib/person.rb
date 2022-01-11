class Person
  attr_reader :name, :interests, :supplies

  def initialize(name_interests)
    @name = name_interests[:name]
    @interests = name_interests[:interests]
    @supplies = Hash.new { |hash, key| hash[key] = 0 }
  end

  def add_supply(name, amount)
    @supplies[name] += amount
  end
end
