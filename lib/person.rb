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
    craft.supplies_required.map do |supply|
      require "pry"; binding.pry
      if supplies.include?(supply) == false
        return false
      elsif supplies.include?(supply) == false
        return true
      end
    end
  end
end
