class Person
  attr_reader :name, :interests, :supplies, :person
  def initialize(person)
    @person = person
    @name = person[:name]
    @interests = person[:interests]
    @supplies = {}
  end

  def add_supply(supply, amount)
    supplies[supply] = amount
  end

  def can_build?(craft)
    craft.supplies_required == @supplies.transform_keys(&:to_sym)
  end


end
