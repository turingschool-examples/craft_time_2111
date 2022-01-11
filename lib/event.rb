class Event
 	attr_reader :name, :crafts, :attendees

 	def initialize(name, crafts, attendees)
 		@name = name
		@crafts = crafts
		@attendees = attendees
 	end

	def attendee_names
		@attendees.map(&:name)
	end

	def craft_with_most_supplies
    @crafts.max_by { |craft| craft.supplies_required.count }.name
	end

	def supply_list
		@crafts.collect do |craft|
      craft.supplies_required.keys.map(&:to_s)
		end.flatten.uniq
	end
 end
