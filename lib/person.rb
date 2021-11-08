class Person
  attr_reader :name,
              :interests,
              :supplies
  def initialize(bio)
    @name = bio[:name]
    @interests = bio[:interests]
    @supplies = {}
  end
end
