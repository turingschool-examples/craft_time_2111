class Person
  attr_reader :name, :interests, :supplies

  def initialize(info)
    @name = info[:name]
    @interests = info[:interests]
    @supplies = Hash.new(0)
  end

  def add_supply(name, quantity)
    @supplies[name] += quantity
  end

  def can_build?(craft)
    supplies_required = craft.supplies_required
    return false if supplies_required.count > @supplies.keys.count
    # for each supply required, check if person has it in correct quantity
    supplies_required.each do |supply, quantity|
      if @supplies.key?(supply.to_s) && @supplies[supply.to_s] >= quantity
        return true
      else
        return false
      end
    end
  end
end
