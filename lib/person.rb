class Person
  attr_reader :name, :interests, :supplies

  def initialize(person)
    @name = person[:name]
    @interests = person[:interests]
    @supplies = Hash.new
  end

  def add_supply(name, quantity)
    if @supplies.keys.include?(name)
      @supplies[name] += quantity
    else @supplies[name] = quantity
    end
  end
end
