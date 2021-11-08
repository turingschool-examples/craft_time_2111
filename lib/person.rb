class Person
  attr_reader :name, :interests, :supplies

  def initialize(info)
    @name = info[:name]
    @interests = info[:interests]
    @supplies = {}
  end

  def add_supply(name, quantity)
    @supplies[name] ||= 0
    @supplies[name] += quantity
  end

  def can_build?(craft)
    craft.supplies_required.each_pair do |supply, quantity|
      return false unless @supplies.include?(supply.to_s)
      return false if quantity > @supplies[supply.to_s]
    end
    true
  end
end