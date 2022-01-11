class Person
  attr_reader :name, :interests, :supplies

  def initialize(name_interests)
    @name = name_interests[:name]
    @interests = name_interests[:interests]
    @supplies = {}
  end
end
