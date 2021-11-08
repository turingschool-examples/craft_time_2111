class Person
  attr_reader :name,
              :interests,
              :supplies

  def initialize(person_info)
    @name      = person_info[:name]
    @interests = person_info[:interests]
    @supplies  = {}
  end

  def add_supply(supply, amount)
    sum = 0
    sum += amount
    @supplies[supply] = amount
    if @supplies.keys.include?(supply)
      @supplies[supply] = sum
    end
  end
end