class Event
  attr_reader :name,
              :crafts,
              :attendees

  def initialize(name, craft, attendee)
    @name = name
    @crafts = [craft].flatten
    @attendees = [attendee].flatten
  end

  def attendee_names
    @attendees.map {|person| person.name}
  end

  def craft_with_most_supplies
    @crafts.group_by {|craft| craft.supplies_required.length}.max[1].map{|craft| craft.name}[0]
  end

  def supply_list
    @crafts.map {|craft| craft.supplies_required}.map {|hash| hash.keys}.flatten.map {|sym| sym.to_s}.uniq
  end

end
