class Event
  attr_reader :name, :crafts, :attendees

  def initialize(name, crafts, attendees)
    @name = name
    @crafts = crafts
    @attendees = attendees
  end

  def attendee_names
    @attendees.map {|person| person.name}
  end

  def craft_with_most_supplies
    @crafts.max_by {|craft| craft.supplies_required.count}.name
  end

  def supply_list
    @crafts.map do |craft|
      craft.supplies_required.keys.map {|key| key.to_s}
    end.flatten.uniq
  end

  def attendees_by_craft_interest
    attendees_by_interest = Hash.new
    @crafts.each do |craft|
      attendees_by_interest[craft.name] = @attendees.select {|person| person.interests.include?(craft.name)}
    end
    attendees_by_interest
  end

  def crafts_that_use(supply)
    @crafts.select do |craft|
      craft.supplies_required.keys.map {|key| key.to_s}.include?(supply)
    end
  end
end
