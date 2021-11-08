class Event

  attr_reader :name, :crafts, :attendee_names

  def initialize(name, craft, names)
    @name = name
    @crafts = [].push(craft).flatten
    @attendee_names = [].push(names).flatten
  end

  def craft_with_most_supplies
    most = @crafts.max {|a, b| a.supplies_required.length <=> b.supplies_required.length}
    most.name
  end

  def supply_list
    supply_array = @crafts.flat_map {|craft| craft.supplies_required}
    item_names = []
    supply_array.each do |hash|
      item_names << hash.keys
    end
    one_array = item_names.flatten.uniq
    one_array.map {|name| name.to_s}
  end

  # def attendees_by_craft_interest
  #   @attendee_names.group_by {|attendee| person.interests }
  # end

end
