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
end
