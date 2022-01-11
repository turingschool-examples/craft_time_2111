class Person
  attr_reader :name, :interests, :supplies

  def initialize(info)
    @name = info[:name]
    @interests = info[:interests]
    @supplies = Hash.new(0)
  end

  def add_supply(name, num)
    @supplies[name] += num
  end

  def can_build?(craft)
    arr = []
    craft.supplies_required.each do |supply, num|
      @supplies.each do |key, value|
        if key == supply.to_s
          arr << true
        else
          arr << false
        end
      end
      #binding.pry
      arr
    end
    arr.each do |boolean|
      return false if boolean == false
      if boolean == true
        return true
      end
    end
  end

end
