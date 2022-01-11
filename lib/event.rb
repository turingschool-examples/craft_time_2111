class Event
attr_reader :name, :crafts, :attendees

  def initialize(name, crafts, attendees)
    @name = name
    @crafts = crafts
    @attendees = attendees
  end

  def attendee_names
    @attendees.map do |attendee|
      # require "pry"; binding.pry
      attendee.name
    end
  end

  def craft_with_most_supplies
    supply = @crafts.find do |craft|
      # require "pry"; binding.pry
      craft.supplies_required.length

    end
    supply .name

  end

  def supply_list
    list = @crafts.map do |craft|
      craft.supplies_required.keys.map do |supply|
        # require "pry"; binding.pry
        supply.to_s
      end
    # require "pry"; binding.pry
  end
  list.flatten.uniq
  end

  def attendees_by_interests(craft)
    # craft.supplies_required.map do |craft|
    # require "pry"; binding.pry
    @attendees.find_all do |attendee|
    attendee.interests.include?(craft.name)
  end
  end


  def attendees_by_craft_interest
    result = Hash.new
    @crafts.map do |craft|
      # if result[craft.name].nil?
        result[craft.name] = attendees_by_interests(craft)
      # end
      end
      result
  end

  def crafts_that_use(supply)
    @crafts.find_all do |craft|
      # require "pry"; binding.pry
    craft.supplies_required.include?(supply.to_sym)
  end
  end

end
