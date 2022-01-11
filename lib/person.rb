class Person
  attr_reader :name, :interests, :supplies

  def initialize(attributes)
    @name = attributes[:name]
    @interests = attributes[:interests]
    @supplies = {}
  end

  def add_supply(name, quantity)
    if @supplies[name] != nil
      @supplies[name] += quantity
    elsif @supplies[name] == nil
      @supplies[name] = quantity
    end
  end

  def can_build?(craft)
    attendee_has = []
    @supplies.keys.each do |key|
      attendee_has << key.to_sym
    end
    attendee_has.sort == craft.supplies_required.keys.sort
  end
end
