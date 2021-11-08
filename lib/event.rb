class Event

  attr_reader :name,
              :crafts,
              :attendees

  def initialize(name, craft, attendees)
    @name = name
    @crafts = craft
    @attendees = attendees
  end

  def attendee_names
    names = []
    @attendees.each do |attendee|
      names.append(attendee.name)
    end
    names
  end

  def craft_with_most_supplies
    supply_count = Hash.new
    @crafts.each do |craft|
      supply_count[craft.name] = craft.supplies_required.count
    end
    supply_count.key(supply_count.values.max)
  end

  def supply_list
    supply_list = []
    @crafts.each do |craft|
      craft.supplies_required.keys.each do |supply|
        supply_list.append(supply.to_s)
      end.flatten
    end
    supply_list.uniq
  end

  def attendees_by_craft_interest
    new_hash = Hash.new
    @crafts.each do |craft|
      new_hash[craft.name] = attendees_interested(craft.name)
    end
    new_hash
  end

  def attendees_interested(craft)
    interested = []
    @attendees.each do |attendee|
      if attendee.interests.include?(craft) == true
        interested << attendee
      end
    end
    interested
  end

end
