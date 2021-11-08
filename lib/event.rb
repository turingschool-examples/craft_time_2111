class Event
  attr_reader :name, :crafts, :attendees
  def initialize(name, crafts, attendees)
    @name = name
    @crafts = crafts
    @attendees = attendees
  end

  def attendee_names
    attendees.map(&:name)
  end

  def craft_with_most_supplies
    most_crafts = crafts.group_by(&:name).max_by do  |_k, v|
       v[0].supplies_required.length
    end
    most_crafts[0]
  end

  def supply_list
    total_supplies = []
    crafts.each do |craft|
      craft.supplies_required.keys.each do |key|
        total_supplies <<  key.to_s
        end
      end
    total_supplies.uniq
  end
end
