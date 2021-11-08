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
    names = @crafts.map {|craft| craft.name}
    required_crafts = @crafts.map {|craft| craft.supplies_required}
    number_of_supplies = required_crafts.map {|list| list.values.count}
    required_hash = Hash[names.zip(number_of_supplies)]
    required_hash.key(required_hash.values.max)
  end

  def supply_list
    required_crafts = @crafts.map {|craft| craft.supplies_required}
    number_of_supplies = required_crafts.map {|list| list.keys.map {|each| each.to_s}}.flatten.uniq
  end

  def attendees_by_craft_interest
    #keys = each craft name
    #values = array << each person object with that craft interest 
  end
end
