require './lib/craft'

class Person
  attr_reader :name, :interests, :supplies
  def initialize(info)
    @name = info[:name]
    @interests = info[:interests]
    @supplies = {}
  end

  def add_supply(key, value)
    supplies[key] = value
  end

  def can_build?(craft)
    supply_values = supplies.values
    craft_values = craft.supplies_required.values
    result = supply_values - craft_values
    result.each do |integer|
      if integer.abs == integer
        return true
      end
    end
  end
end
