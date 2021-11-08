class Person
  attr_reader :name, :interests

  def initialize(info)
    @name = info[:name]
    @interests = info[:interests]
  end
end 
