class Event
  attr_reader :name, :crafts, :attendees

  def initialize(name, crafts, person)
    @name = name
    @crafts = crafts
    @attendees = person
  end

  def attendee_names
    names = []
    @attendees.each do |person|
      # binding.pry
      names << person.name
      # binding.pry
    end
    names
  end

  def craft_with_most_supplies
    # this is not a good method. I aware
    if @crafts[0].supplies_required.size > @crafts[1].supplies_required.size
      @crafts[0].name
    else
      @crafts[1].name
    end
  end

  def supply_list
    list = []
    @crafts.each do |craft|
      # binding.pry
      list << craft.supplies_required.keys
    end
    list = list.flatten
    new_list = []
    list.each do |item|
      new_list << item.to_s
    end
    # binding.pry
    new_list.uniq
  end
end
