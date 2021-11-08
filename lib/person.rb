class Person
  attr_reader :name, :interests, :supplies
  def initialize(name_and_interests)
    @name = name_and_interests[:name]
    @interests = name_and_interests[:interests]
    @supplies = {}
  end
end
