class Person
  attr_reader :name, :interests
  attr_accessor :supplies
  def initialize(hash)
    @name = hash[:name]
    @interests = hash[:interests]
    @supplies = Hash.new { |h, k| h[k] = 0 }
  end

  def add_supply(name, quantity)
    @supplies[name] += quantity 

  end

end
