class Event
  attr_reader :name, :crafts, :attendees

  def initialize(name, crafts, attendees)
    @name = name
    @crafts = crafts
    @attendees = attendees
  end

  def attendee_names
    @attendees.map do |attendee|
      attendee.name
    end
  end

  def craft_with_most_supplies
    @crafts.max_by do |craft|
      craft.supplies_required.count
    end.name
  end

  def supply_list
    supply_array = []
    @crafts.map do |craft|
      craft.supplies_required.each_key do |supply_name|
        supply_array.push(supply_name.to_s)
      end
    end
    supply_array.uniq
  end

  def attendees_by_craft_interest
    attendees_by_craft_interest_hash = {}
    @crafts.each do |craft|
      @attendees.each do |attendee|
        attendees_by_craft_interest_hash[craft.name] ||= []
        if attendee.interests.include?(craft.name)
          attendees_by_craft_interest_hash[craft.name].push(attendee)
        end
      end
    end
    attendees_by_craft_interest_hash
  end

  def crafts_that_use(select_supply)
    crafts_that_use_array = @crafts.select do |craft|
      craft.supplies_required.key?(select_supply.to_sym)
    end
  end

  # def can_build_crafts_list

  # end

  # def assign_attendees_to_crafts
  #   can_build_hash = {}
  #   @attendees.each do |person|
  #     @crafts.each do |craft|
  #       can_build_hash[person] ||= []
  #       can_build_hash[person].push(craft) if person.can_build?(craft) && person.interests.include?(craft.name)
  #     end
  #   end

  #   can_build_hash.each_value do |crafts|
  #     crafts.
  #   end
  # end
end