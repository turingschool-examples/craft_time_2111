class Person
  attr_reader :name, :interests, :supplies

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @interests = attributes.fetch(:interests)
    @supplies = {}
  end
end
