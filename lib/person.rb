class Person
  attr_reader :name, :interests, :supplies 

  def initialize(hash_data)
    @name = hash_data[:name]
    @interests = hash_data[:interests]
    @supplies = {}
  end
end
