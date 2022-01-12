require 'set'
class Person
  attr_reader :name, :interests, :supplies
  def initialize(attributes)
    @name = attributes[:name]
    @interests = attributes[:interests]
    @supplies = {}
  end

  def add_supply(supply, quantity)
    if @supplies.key?(supply)
      @supplies[supply] += quantity
    else
      @supplies[supply] = quantity
    end
  end

  def can_build?(craft)
       craft.supplies.all? do |item, quantity|
      @supplies[item.to_s] >= quantity
       end
   end



end
# ( @supplies[k] >= craft.supplies[k]  )
