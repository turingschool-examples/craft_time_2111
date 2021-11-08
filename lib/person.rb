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

  # well now we are adding existing supplies.
  # check if key already exists, then add amount
  # to existing amount.
  def add_supply(supply, amount)
    if supplies.has_key?(supply)
      supplies[supply] += amount
    else
      supplies[supply] = amount
    end
  end


  # has_supplies?(craft)
  #   check = []
  #   craft.supplies_required.keys.map do |key|
  #     if supplies.has_key?(key)
  #       check << key
  #     end
  #     unless check.flatten.count == craft.supplies_required.keys.count
  #       return false
  #   end
  # end


  # retrieve the keys for the supplies for the craft
  # if the supplies the person has includes every
  # key, move on to finding if the amount (value)
  # is greater than or equal to the amount

  # for every craft.keys....
  # check if supplies .has_key?

  # build out helper method for refactoring if had time
  def can_build?(craft)
    check = 0
    craft.supplies_required.keys.each do |required_tool|
      if supplies.has_key?(required_tool.to_s)
        check += 1
        require "pry"; binding.pry
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
