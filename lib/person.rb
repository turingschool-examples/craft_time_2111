class Person

  attr_reader :name, :interests, :supplies

  def initialize(attributes)
    @name = attributes[:name]
    @interests = attributes[:interests]
    @supplies = {}
  end

  def add_supply(item, amount)
   supply = @supplies[item] = amount

   #need to add a value of new item that has same key
   #transform values?
   # group by?
  end
end
