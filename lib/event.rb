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
end
