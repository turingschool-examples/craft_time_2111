class Person
  attr_reader :name,
              :interests,
              :supplies
  def initialize(data)
    @name       = data[:name]
    @interests  = data[:interests]
    @supplies   = Hash.new(0)
  end

  def add_supply(material, amount)
    @supplies[material] += amount
  end


  def can_build?(craft)
      supply = @supplies.transform_keys {|k,v| k.to_sym}
      if (supply.keys & craft.supplies_required.keys).all? && supply.values.sum > craft.supplies_required.values.sum
        true
      else
        false
      end
    end
    
end