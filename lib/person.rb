class Person
  attr_reader :name, :interests, :supplies
  def initialize(attributes)
    @name = attributes[:name]
    @interests = attributes[:interests]
    @supplies = {}
  end

  def add_supply(supply_name, amount)
    @supplies[supply_name] ||= 0
    @supplies[supply_name] += amount
  end

  def can_build?(craft_name)
    if self.supplies >= craft_name.supplies_required
      true
    else
      false
    end
  end
end
