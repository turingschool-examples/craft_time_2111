class Person

  attr_reader :name, :interests, :supplies

  def initialize(inputted_hash)
    @name = inputted_hash[:name]
    @interests = inputted_hash[:interests]
    @supplies = {}
  end


end
