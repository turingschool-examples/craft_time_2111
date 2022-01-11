class Event
  attr_reader :name, :crafts, :attendees

  def initialize(name, craft, person)
    @name = name
    @crafts = craft
    @attendees = person
  end

  def attendee_names
    attendees.map { |person| person.name }
  end

  def craft_with_most_supplies
    max = crafts.max_by { |craft| craft.supplies_required.count }
    max.name
  end

  def supply_list
    results = []
    crafts.each do |craft|
      craft.supplies_required.each_key do |supply|
        results << supply.to_s
      end
    end
    results.uniq
  end
end
