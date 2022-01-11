class Person
  attr_reader :name, :interests
  attr_accessor :supplies
  def initialize(hash)
    @name = hash[:name]
    @interests = hash[:interests]
    @supplies = {}
  end

end
