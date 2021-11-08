class Person
  attr_reader :name,
              :interests,
              :supplies
  def initialize(info)
    @name = info[:name]
    @interests = info[:interests]
    @supplies = Hash.new(0)
  end

  def add_supply(item, quantity)
    supplies[item] += quantity
  end

  #getting close on this one! Left off here
  def can_build?(craft)
      hash = @supplies.transform_keys do |key|
                key.to_sym
          end
      hash == craft.supplies_required
  end
end
