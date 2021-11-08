class Event
  attr_reader :name, 
              :crafts, 
              :attendees

  def initialize(name, crafts = [], attendees = [])
    @name      = name 
    @crafts    = crafts
    @attendees = attendees
  end

  def attendee_names
    @attendees.map { |attendee| attendee.name }
  end

  def craft_with_most_supplies
    @crafts.max_by do |craft|
      craft.supplies_required.length
    end.name
  end

  def supply_symbols_list
        @crafts.map do |craft|
      craft.supplies_required.keys
    end.flatten
  end

  def supply_list
    @crafts.map do |craft|
      craft.supplies_required.keys
    end.flatten
  end
end