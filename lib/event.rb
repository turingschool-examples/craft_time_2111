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

	def attendees_by_craft_interest
    h = Hash.new { |hash, key| hash[key] = [] }
		interests =@crafts.collect(&:name).flatten.uniq

		@attendees.each do |attendee|
			interests.each do |interest|
				h[interest] << attendee if attendee.interests.include?(interest)
			end
    end
		h
	end

	def crafts_that_use(item)
    @crafts.select do |craft|
      craft if craft.supplies_required.include?(item.to_sym)
		end
	end
 end
