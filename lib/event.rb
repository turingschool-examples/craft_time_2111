class Event
  attr_reader :name,
              :crafts,
              :attendees
  def initialize(name, crafts, attendees)
    @name = name
    @crafts = []
    @attendees = []
  end

  def add_crafts(craft)
    @crafts << craft
  end

  def add_attendees(person)
    @attendees << person
  end

  def attendee_names
    @attendees.map do |attendee|
      attendee.name
    end
  end

  def craft_with_most_supplies
    craft = @crafts.max_by do |craft|
      craft.supplies_required.length
    end
    craft.name
  end

  def supply_list
    supplies = []
    @crafts.map do |craft|
      craft.supplies_required.each do |item, quantity|
      supplies << item.to_s
      end
    end
    supplies.uniq
  end
end
