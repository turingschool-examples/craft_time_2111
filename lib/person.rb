class Person

  attr_reader :name, :interests, :supplies

  def initialize(info)
    @name = info[:name]
    @interests = info[:interests]
    @supplies = Hash.new{0}
  end

  def add_supply(item, qty)
    if !@supplies.has_key?(item)
      @supplies[item] = qty
    else
      @supplies[item] += qty
    end
  end

  def can_build?(craft)
    supply_check = craft.supplies_required.map do |supply, qty|
      @supplies[supply.to_s] >= qty
    end
    supply_check.all?
  end
end
