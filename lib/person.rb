class Person

  def initialize(argument)
    @argument = argument
  end

  def name
    @argument[:name]
  end

  def interests
    @argument[:interests]
  end 
end
