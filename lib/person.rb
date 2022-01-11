class Person
  attr_reader :name, :interests

  def initialize(info)
    @name = info[:name]
    @interests = info[:interests]
    @supplies = {}
  end

  def supplies
    @supplies
  end

  def add_supply(type, size)
    @supplies[type] = size
  end

end
