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

   def can_build?(craft)
     @supplies.include?(craft.supplies_required)
   end
 end
end
