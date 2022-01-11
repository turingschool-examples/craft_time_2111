class Person
  attr_reader :name, :interests
  def initialize(name_interests_hash)
    @name_interests_hash = name_interests_hash
    @name = @name_interests_hash[:name]
  end
end
