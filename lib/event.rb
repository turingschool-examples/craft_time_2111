class Event
  attr_reader :name, :crafts, :attendees
  def initialize(name, crafts, attendees)
    @name = name
    @crafts = crafts
    @attendees = attendees
  end

  def attendee_names
    @attendees.map {|attendee| attendee.name}
  end

  def craft_with_most_supplies
    craft_map = @crafts.select {|craft| craft.supplies_required.max_by(&:length)}
    craft_map.first.name
  end

  def supply_list
    @crafts.map {|craft| craft.supplies_required.keys.map{|supply| supply.to_s}}.flatten.uniq
  end
end
