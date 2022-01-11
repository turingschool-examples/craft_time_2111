class Person
  attr_reader :name, :interests

  def initialize(attributes)
    @name = attributes[:name]
    @interests = attributes[:interests]
  end
end
