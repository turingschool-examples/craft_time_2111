require './lib/craft'
#
#
class Person

  attr_reader :name, :interests, :supplies

  def initialize(info)
    @name = info[:name]
    @interests = info[:interests]
    @supplies = {}
  end

  def add_supply(material, quantity)
    @supplies[material] ||= 0
    @supplies[material] += quantity
  end

  def can_build?(craft)
    tru = 0
    fals = 0
    # require "pry"; binding.pry
    craft.supplies_required.each_pair do |material, quantity|
      if @supplies.keys.include?(material.to_s) && quantity >= @supplies[material]
        tru += 1
      else
        fals += 1
      end
    end
    if tru >= fals
      true
    else
      false
    end
  end

end
