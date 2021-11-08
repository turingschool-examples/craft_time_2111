class Person

  attr_reader :name, :interests, :supplies

  def initialize(inputted_hash)
    @name = inputted_hash[:name]
    @interests = inputted_hash[:interests]
    @supplies = {}
  end

  def add_supply(supply_key, supply_value)
    if @supplies[supply_key] == nil
      @supplies[supply_key] = supply_value
    else
      @supplies[supply_key] = @supplies[supply_key] + supply_value
    end
  end

  def can_build?(craft)

    # Check if key exists, if not, return false
    check_total_array = []
    craft.required_supplies.each do |key, value|
      if @supplies[key.to_s] == nil
        check_total_array << false
      elsif @supplies[key.to_s] >= value # if key exists and value >= required, return true
        check_total_array << true
      else
        check_total_array << false
      end
    end
    # If any values don't exist or are less than required, return false
    if check_total_array.include?(false)
      false
    else
      true
    end

  end
end
