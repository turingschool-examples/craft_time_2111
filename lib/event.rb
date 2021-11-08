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
   supply_symbols_list.map { |symbol| symbol.to_s}.uniq
  end

  def attendees_by_craft_interest
    @crafts.reduce({}) do |hash, craft|
      hash[craft.name.to_s] = @attendees.find_all do |attendee|
        attendee.interests.include?(craft.name.to_s)
      end
      hash
    end
  end

  def crafts_that_use(tool)
    crafts = []
    @crafts.each do |craft|
      if craft.supplies_required.keys.include?(tool.to_sym)
        crafts << craft
      end
    end
    crafts
  end
end