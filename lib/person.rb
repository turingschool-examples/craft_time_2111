class Person
  attr_reader :name, :interests, :suplies

  def initialize(data)
    @name = data[:name]
    @interests = data[:interests]
    @suplies = {}
  end
end
