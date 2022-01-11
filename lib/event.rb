class Event
  attr_reader :name, :crafts, :attendees

  def initialize(name, crafts, attendees)
    @name = name
    @crafts = crafts
    @attendees = attendees
  end

  def attendee_names
    @attendees.map do |attendee|
      attendee.name
    end
  end

  def craft_with_most_supplies
    c = @crafts.max_by do |craft|
      craft.supplies_required.count
    end
    c.name
  end

  def supply_list
    a = []
    @crafts.each do |craft|
      craft.supplies_required.each do |k,v|
        a << k.to_s
      end
    end
    a.uniq
  end

  def attendees_by_craft_interest
    h = {}
    @crafts.each do |craft|
      h[craft.name] = []
    end
    @attendees.each do |person|
      person.interests.each do |interest|
        if h.keys.include? interest
          h[interest] << person
        end
      end
    end
    h
  end

  def crafts_that_use(supply_name)
    a = []
    @crafts.each do |craft|
      craft.supplies_required.each do |name, qty|
        a << craft if name.to_s == supply_name
      end
    end
    a
  end

  def assign_attendees_to_crafts
    h = {}
    a = []
    @crafts.each do |craft|
      h[craft] = []
      a << craft.name
    end
    @attendees.each do |person|
      person.interests.each do |interest|
        @crafts.each do |craft|
          if a.include? interest && person.can_build?(craft)
            h[craft] << person
          end
        end
      end
    end
    h
  end
end
