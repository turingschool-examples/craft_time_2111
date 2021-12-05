class Person
  attr_reader :name,
              :interests,
              :supplies
  def initialize(bio)
    @name = bio[:name]
    @interests = bio[:interests]
    @supplies = {}
  end

  # take the first arg and assign it to hash key
  # take the second arg and assign it to value
  # check if key already exists, then add amount
  # to existing amount.
  def add_supply(supply, amount)
    if supplies.has_key?(supply)
      supplies[supply] += amount
    else
      supplies[supply] = amount
    end
  end

  def can_build?(craft)
    check = 0
    craft.supplies_required.keys.each do |required_tool|
      if supplies.has_key?(required_tool.to_s)
        check += 1
      end
      return false if check < craft.supplies_required.keys.count
    craft.supplies_required.keys.each do |supply_required|
      supplies.values.each do |supply_amount|
        if supply_amount < supply_required
          return false
        end
      end
    end
  end
end

end
