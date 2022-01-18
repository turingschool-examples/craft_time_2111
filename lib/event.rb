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
    max_craft = @crafts.max_by do |craft|
      craft.supplies_required.count
    end
    max_craft.name
    # Initial code below: Refactored code above with better enumerable
      # supplies_required = 0
      # craft_with_most_supplies = nil
      # @crafts.each do |craft|
      #   if craft.supplies_required.count > supplies_required
      #     (supplies_required = craft.supplies_required.count) && (craft_with_most_supplies = craft.name)
      #   end
      # end
      # craft_with_most_supplies
  end

  def supply_list
    supply_list = []
    @crafts.each do |craft|
      craft.supplies_required.each_key do |item|
        supply_list.include?(item) ? next : supply_list << item.to_s
      end
    end
    supply_list.uniq
  end

  def attendees_by_craft_interest
    attendees_by_craft_interest = {}
    @crafts.each do |craft|
      if !attendees_by_craft_interest.has_key?(craft.name)
        attendees_by_craft_interest[craft.name] = []
      end
      @attendees.each do |attendee|
        if attendee.interests.include?(craft.name)
          attendees_by_craft_interest[craft.name] << attendee
        end
      end
    end
    attendees_by_craft_interest
  end

  def crafts_that_use(item)
    @crafts.select do |craft|
      craft.supplies_required.keys.to_s.include?(item)
    end
  end

  def assign_attendees_to_crafts
    assigned_attendees = {}
    eligible_crafts_by_attendee = {}

    @attendees.each do |attendee|
      if !eligible_crafts_by_attendee.has_key?(attendee)
        eligible_crafts_by_attendee[attendee] = []
      end
      @crafts.each do |craft|
        if attendee.interests.include?(craft.name) && attendee.can_build?(craft)
          eligible_crafts_by_attendee[attendee] << craft
        end
      end
    end
    @crafts.each do |craft|
      if !assigned_attendees.has_key?(craft)
        assigned_attendees[craft] = []
      end
    end

    eligible_crafts_by_attendee.each_pair do |attendee, craft|
      if craft.count == 1
        assigned_attendees[craft[0]] << attendee
      elsif craft.count > 1
        assigned_attendees[craft.sample] << attendee
      end
    end
    assigned_attendees
  end

end
