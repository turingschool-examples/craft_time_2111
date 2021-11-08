class Event
  attr_reader :name, :crafts, :attendees

  def initialize(name, crafts, attendees)
    @name = name
    @crafts = crafts
    @attendees = attendees
  end

  def attendee_names
    attendee_names = @attendees.map{|attendee| attendee.name}
  end

  def craft_with_most_supplies
    @crafts.max_by{|craft|craft.supplies_required.keys.count}.name
  end

  def supply_list
    crafts = @crafts.flat_map{|craft| craft.supplies_required.keys}
    crafts.uniq!.map{|name| name.to_s}
  end

  #returns a hash where the keys are the names of all
  # of the crafts in the event, and the values are arrays
  # of attendees who are interested in that craft.
  def attendees_by_craft_interest
    attendees_by_craft_interest = Hash.new()
    @crafts.each do |craft|
      attendees_by_craft_interest[craft.name] ||= []
      @attendees.each do |attendee|
        if attendee.interests.include?(craft.name)
          attendees_by_craft_interest[craft.name] << attendee
        end
      end
    end
    attendees_by_craft_interest
  end

  def crafts_that_use(supply)
    @crafts.select do |craft|
      craft.supplies_required.keys.to_s.include?(supply)
    end
  end


  # returns a hash where the keys are each craft in the event,
  # and the values are arrays of randomly chosen attendees who
  # are interested in and can build that craft.
  def assign_attendees_to_crafts
    attendees_by_craft = Hash.new()
    @crafts.each do |craft|
      attendees_by_craft[craft] ||= []
      possible_attendees = attendees_by_craft_interest[craft.name].select{|attendee|attendee.can_build?(craft)}
      number_selected = (0..possible_attendees.length).to_a.sample(1)[0]
      selected_attendees = possible_attendees.sample(number_selected)
      attendees_by_craft[craft] = selected_attendees
    end
    attendees_by_craft
  end
end
