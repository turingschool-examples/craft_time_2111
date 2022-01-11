class Person

attr_reader :name, :interests, :supplies
def initialize(attributes)
  @name = attributes[:name]
  @interests = attributes[:interests]
  @supplies = {}
end

  def add_supply(item, count)
    @supplies[item] = count
  end
end
