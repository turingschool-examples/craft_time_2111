class Person
  attr_reader :name, :interests, :supplies

  def initialize(person)
    @name = person[:name]
    @interests = person[:interests]
    @supplies = Hash.new
  end

  def add_supply(name, quantity)
    if @supplies.keys.include?(name)
      @supplies[name] += quantity
    else @supplies[name] = quantity
    end
  end

  def can_build?(craft)
    needed_supplies = craft.supplies_required.transform_keys{|key| key.to_s}
    if needed_supplies.keys.sort == @supplies.keys.sort
      x = (@supplies.keys & needed_supplies.keys).map {|key| @supplies[key] >= needed_supplies[key]}
      x.all?(true)
    else
      false
    end
  end
end
