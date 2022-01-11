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
    craft_map = @crafts.select {|craft| craft.supplies_required.max_by(&:length)}
    craft_map.first.name
  end

  def supply_list
    req_supplies = @crafts.map {|craft| craft.supplies_required}
    total_supplies = req_supplies.map {|list| list.keys.map {|each| each.to_s}}.flatten.uniq
  end

  

end
