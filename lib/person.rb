class Person
  attr_reader :name, :interests, :supplies
  def initialize(attributes)
    @name = attributes[:name]
    @interests = attributes[:interests]
    @supplies = {}
  end

  def add_supply(name, cost)
    x = { name => cost}
    if @supplies.has_key?(name)
        @supplies.merge!(x) { |key, old, new| if key == key
        old + new
      end}
    else
      create_hash(name, cost)
    end
    return @supplies
  end

  def create_hash(name, cost)
    @supplies[name] = cost
  end

end





# @supplies.merge(@supplies) { |key, old, new| if key == key
#    old + new
#  end }
