class Person
  attr_reader :name,
              :interests,
              :supplies
  def initialize(data)
    @name       = data[:name]
    @interests  = data[:interests]
    @supplies   = {}
  end

  def add_supply(material, amount)
    @supplies[material] ||= 0
    @supplies[material] += amount
  end
end