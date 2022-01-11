class Person
  attr_reader :name,
              :interests,
              :supplies

  def initialize(attributes)
    @name = attributes[:name]
    @interests = attributes[:interests]
    @supplies = {}
  end

  def add_supply(item, amount)
    if @supplies[item].nil?
      @supplies[item] = amount
    else
      @supplies[item] += amount
    end
  end

  def can_build?(craft)
    craft.supplies_required.size == @supplies.size
  end
end
