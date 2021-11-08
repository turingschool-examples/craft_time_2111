class Person
  attr_reader :name, :interests, :supplies

  def initialize(info_hash)
    @name = info_hash[:name]
    @interests = info_hash[:interests]
    @supplies = {}
  end

  def add_supply(item, quantity)
    supplies[item] ||= 0
    supplies[item] += quantity
  end

  def can_build?(craft)
    @supplies == craft.supplies_required
  end
end
