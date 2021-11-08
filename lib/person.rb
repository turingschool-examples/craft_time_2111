class Person
  attr_reader :name,
              :interests,
              :supplies

  def initialize(attributes)
    @name      = attributes[:name]
    @interests = attributes[:interests]
    @supplies  = Hash.new {|hash, key| hash[key] = 0}
  end

  def add_supply(item, value)
    @supplies[item] += value
  end
end
