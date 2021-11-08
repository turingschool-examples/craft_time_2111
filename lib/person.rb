class Person

  attr_reader :name, :interests, :supplies

  def initialize(person_info)
    @name = person_info[:name]
    @interests = person_info[:interests]
    @supplies = {}
  end

  def add_supply(supply, amount)
    if @supplies.has_key? supply
      @supplies[supply] += amount
    elsif not @supplies.has_key? supply
    @supplies[supply] = amount
    end
  end

  def can_build?(craft)
    list = craft.supplies_required.keys
    required_array = list.map {|item| item.to_s}
    person_supplies = @supplies.keys
    (required_array - person_supplies).empty?
  end

  # def interests(array)
  # end
end
