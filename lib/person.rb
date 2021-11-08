class Person

  attr_accessor :name, :interests, :supplies

  def initialize(hash)
    @name = hash[:name]
    @interests = hash[:interests]
    @supplies = {}
  end

  def add_supply(name, count)
    @supplies[name] = count
  end
end
