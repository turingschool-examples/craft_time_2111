class Event
  attr_reader :name, :crafts, :attendees
  def initialize(name, crafts, attendees)
    @name = name
    @crafts = crafts
    @attendees = attendees
  end

  def attendee_names
    a = []
      @attendees.select do |person|
          a << person.name
        end
      return a
  end

  def craft_with_most_supplies
     @crafts.max_by { |craft| craft.supply_count }.name
  end

  def supply_list
    a = []
    @crafts.each do |craft|
       a << craft.all_supplies
    end
    return a.flatten.uniq
  end


end
