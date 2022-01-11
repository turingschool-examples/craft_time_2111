class Person
  attr_reader :name,
              :interests,
              :supplies

  def initialize(info)
    @name = info.fetch(:name)
    @interests = info.fetch(:interests)
    @supplies = Hash.new(0)
  end

  def add_supply(name, qty)
    # require 'pry'; binding.pry
    @supplies[name] = @supplies[name] + qty
  end
end
