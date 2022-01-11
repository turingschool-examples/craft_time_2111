class Person

  attr_reader :name, :interests, :supplies

  def initialize(info)
    @name = info[:name]
    @interests = info[:interests]
    @supplies = {}
  end

  def add_supply(item, qty)
    if !@supplies.has_key?(item)
      @supplies[item] = qty
    else
      @supplies[item] += qty
    end
  end

end
