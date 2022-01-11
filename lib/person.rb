class Person
 	attr_reader :attributes, :name, :interests, :supplies

 	def initialize(attributes)
		@attributes = attributes
 		@name = attributes[:name]
 		@interests = attributes[:interests]
 		@supplies = {}
 	end

	def add_supply(item, quantity)
		@supplies[item] = quantity
 end
end
