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

  def supplies_to_symbol
    @supplies.transform_keys { |type| type.to_sym }
  end

  def can_build?(craft)
    return false if @supplies.empty?

    if @supplies.keys
    
    end
  end
end