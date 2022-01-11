class Person
  attr_reader :name, :interests, :supplies

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @interests = attributes.fetch(:interests)
    @supplies = {}
  end

  def add_supply(object, how_many)
    @supplies[object] = (how_many)
  end
end
