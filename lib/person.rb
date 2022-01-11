class Person
 	attr_reader :attributes, :name, :interests, :supplies

 	def initialize(attributes)
		@attributes = attributes
 		@name = attributes[:name]
 		@interests = attributes[:interests]
 		@supplies = Hash.new { |hash, key| hash[key] = 0 }
 	end

	def add_supply(item, quantity)
		@supplies[item] += quantity
 end

 def can_build?(craft)
	 craft.supplies_required.all? do |item|
    @supplies.include?(item)
	 end
 end
end
