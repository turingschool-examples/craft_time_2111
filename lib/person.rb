class Person
  attr_reader :info
  def initialize(info)
    @info = info
  end

  def name
    info[:name]
  end

  def interests
    info[:interests]
  end
end
