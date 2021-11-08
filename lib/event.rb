class Event
  attr_reader :name,
              :crafts,
              :attendees
  def initialize(name, crafts, attendees)
    @name       = name
    @crafts     = crafts
    @attendees  = attendees
  end

  def attendee_names
    @attendees.map do |attendee|
      attendee.name
    end
  end

  def craft_with_most_supplies
    craft_info = @crafts.max_by do |craft|
      craft.supplies_required.length
    end
    craft_info.name
  end

  def supply_list
    supply_list = []
    @crafts.each do |craft|
      craft.supplies_required.keys.each do |type|
      supply_list  << type.to_s
      end
    end
    supply_list.uniq
  end

  def attendees_by_craft_interest
    interest_hash = {}
    @crafts.each do |craft|
      @attendees.each do |attendee|
        interest_hash[craft.name] ||= []
        if attendee.interests.include?(craft.name)
          interest_hash[craft.name] << attendee
        end
      end
    end
    interest_hash
  end

  def crafts_that_use(element)
    @crafts.find_all do |craft|
      craft.supplies_required.keys.include?(element.to_sym)
    end
  end

  # def assign_attendees_to_crafts
  #   assignment = {}
  #   eligible_attendees = []
  #   @crafts.each do |craft|
  #     @attendees.each do |attendee|
  #       assignment[craft.name] ||= []
  #       if attendee.interests.include?(craft.name) && attendee.can_build?(craft)
  #         eligible_attendees << attendee
  #       end
  #       assignment[craft.name] << eligible_attendees.sample
  #     end
  #   end
  #   assignment
  #   require "pry"; binding.pry
  # end

   def assign_attendees_to_crafts
     assignment = {}
     eligible = []
     attendees_by_craft_interest.each do |craft, attendees|
       @crafts.each do |craft|
         attendees.each do |attendee|
         assignment[craft] ||= []
         if attendee.interests.include?(craft.name) && attendee.can_build?(craft)
           eligible << attendee
           assignment[craft] << eligible.sample
         end
       end
      end
    end
    assignment
  end
end



