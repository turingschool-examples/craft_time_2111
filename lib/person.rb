class Person
attr_reader :supplies

  def initialize(argument)
    @argument = argument
    @supplies = {}
  end

  def name
    @argument[:name]
  end

  def interests
    @argument[:interests]
  end

  # def supplies
  #   @supplies
  # end
end
