class Person
  attr_reader :name,
              :interests,
              :supplies
  def initialize(info)
    @name = info[:name]
    @interests = info[:interests]
    @supplies = {}
  end

  def add_supply(supply, amount)
    if @supplies.keys.include?(supply) == false
      @supplies[supply] = amount
    else
      @supplies[supply] += amount
    end
  end

  def can_build?(craft)
    if @supplies == craft.supplies_required
      true
    else
      false
    end
  end
end
