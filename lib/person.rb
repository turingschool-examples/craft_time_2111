class Person
  attr_reader :name, :interests, :supplies

  def initialize(name_interests)
    @name = name_interests[:name]
    @interests = name_interests[:interests]
    @supplies = Hash.new { |hash, key| hash[key] = 0 }
  end

  def add_supply(name, amount)
    @supplies[name] += amount
  end

  def can_build?(craft)
    enough_supplies = {}
    needed_supplies = craft.supplies
    @supplies.each_pair do |name, amount|
      needed_supplies.each_pair do |name_2, amount_2|
        if name == name_2 && amount_2 - amount > 0
          enough_supplies[name] = amount_2 - amount
        end
      end
    end
    needed_supplies.each_pair do |name, amount|
      if @supplies.keys.include?(name.to_s) == false
        enough_supplies[name] = needed_supplies[name]
      end
    end
    enough_supplies == {} ? true : false
  end
end
