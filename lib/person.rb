class Person
  attr_reader :name,
              :interests,
              :supplies

  def initialize(info)
    @name = info[:name]
    @interests = info[:interests]
    @supplies = {}
  end

  def add_supply(supply, quantity)
    if @supplies[supply].nil?
      @supplies[supply] = quantity
    else
      @supplies[supply] += quantity
    end
  end

  def can_build?(craft)
    result = []
   craft.supplies_required.map do |supply, value|
     if !@supplies.keys.include?(supply.to_s)
       result << false
     else
       result << true
     end
   end

   if result.include?(false)
     false
   else
     true
   end
  end
end
