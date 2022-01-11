class Event

  attr_reader :name, :crafts, :attendees

  def initialize(name, crafts, attendees)
    @name = name
    @crafts = crafts
    @attendees = attendees
  end

  def attendee_names
    names = @attendees.map do |attendee|
      attendee.name
    end
  end

  def craft_with_most_supplies
    supplies_required = 0
    craft_with_most_supplies = nil
    @crafts.each do |craft|
      if craft.supplies_required.count > supplies_required
        (supplies_required = craft.supplies_required.count) && (craft_with_most_supplies = craft.name)
      end
    end
    craft_with_most_supplies
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
    a_b_c_i = {}
    @crafts.each do |craft|
      if !a_b_c_i.has_key?(craft.name)
        a_b_c_i[craft.name] = []
      end
      @attendees.each do |attendee|
        if attendee.interests.include?(craft.name)
          a_b_c_i[craft.name] << attendee
        end
      end
    end
    a_b_c_i
  end

  def crafts_that_use(item)
    @crafts.select do |craft|
      craft.supplies_required.keys.to_s.include?(item)
    end
  end

  def assign_attendees_to_crafts
  end

end
