class Person
  attr_reader :name,
              :interests,
              :supplies
  def initialize(data)
    @name       = data[:name]
    @interests  = data[:interests]
    @supplies   = {}
    require "pry"; binding.pry
  end
end