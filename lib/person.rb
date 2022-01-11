class Person
  attr_reader :name, :interests, :supplies
  def initialize(name_interests_hash)
    @name_interests_hash = name_interests_hash
    @name = @name_interests_hash[:name]
    @interests = @name_interests_hash[:interests]
    @supplies = {}
  end
end
