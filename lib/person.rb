

class Person
  attr_reader :name,
              :interests,
              :supplies


  def initialize(details)
    @name = details[:name]
    @interests = details[:interests]
    @supplies =Hash.new
  end

  def add_supply(supply, amount)
    if @supplies.keys.include?(supply)
      @supplies[supply] += amount
    else
      @supplies[supply] = amount
    end
  end



end
