class Person
  attr_reader :name, :interests
  attr_accessor :supplies
  def initialize(info)
    @name = info[:name]
    @interests = info[:interests]
    @supplies = {}
  end

end
