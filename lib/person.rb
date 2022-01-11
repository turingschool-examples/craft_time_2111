class Person
  attr_reader :name, :interests, :supplies

  def initialize(info)
    @name = info[:name]
    @interests = info[:interests]
    @supplies = Hash.new(0)
  end

  def add_supply(name, amount)
    @supplies[name] += amount
  end

  def can_build?(craft)
    supplies_required = craft.supplies_required
    return false if  supplies_required.count > @supplies.keys.count
    supplies_required.each do |supply, amount|
      if @supplies.key?(supply.to_s) && @supplies[supply.to_s] >= amount
        return true
      else
        return false
      end
    end
  end 
end
