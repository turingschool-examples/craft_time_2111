class Person
  attr_reader :name, :interests, :supplies

  def initialize(person)
    @name = person[:name]
    @interests = person[:interests]
    @supplies = {}
  end

  def add_supply(name, quantity)
    if @supplies.key?(name) == false
      @supplies[name]= quantity
    else @supplies.key?(name) == true
      @supplies[name] += quantity
    end
  end
end
