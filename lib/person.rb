class Person

  attr_accessor :name, :interests, :supplies

  def initialize(hash)
    @name = hash[:name]
    @interests = hash[:interests]
    @supplies = {}
  end

  def add_supply(name, count)
    @supplies[name] = count
  end

  def can_build?(craft)
    supplies_required_names = craft.supplies_required.keys
    supplies_required_names = supplies_required_names.map { |key| key.to_s  }
    person_supply_names = @supplies.keys

    if !(supplies_required_names - person_supply_names).empty?
      return false
    end

    craft.supplies_required.each do |name, count|
      # require 'pry'; binding.pry
      if @supplies[name.to_s] < count
        return false
      end
    end

    true
  end
end
