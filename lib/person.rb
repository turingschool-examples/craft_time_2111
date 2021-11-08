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
end