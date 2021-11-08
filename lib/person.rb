class Person
  attr_reader :name,
              :interests
  def initialize(bio)
    @name = bio[:name]
    @interests = bio[:interests]
  end
end
