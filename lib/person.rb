class Person
  attr_reader :name, 
              :interests,
              :supplies
              
  def initialize(info)
    @name      = info[:name]
    @interests = info[:interests]
    @supplies  = {}
  end

  def add_supply(type, quantity)
    if @supplies.keys.include?(type)
      @supplies[type] += quantity
    else 
      @supplies[type] = quantity
    end
  end

  def can_build?(craft)
    return false if @supplies.empty?
     
    has_supplies = @supplies.map do |type1, quantity1|
      craft.supplies_required.find_all do |type2, quantity2|
        type1 == type2.to_s && quantity1 >= quantity2
      end
    end
    has_supplies.length == craft.supplies_required.length
  end
end