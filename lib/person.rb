class Person

  attr_reader :name, :interests, :supplies

  def initialize(info)
    @name = info[:name]
    @interests = info[:interests]
    @supplies = {}
  end

  def add_supply(item, qty)
    if !@supplies.has_key?(item)
      @supplies[item] = qty
    else
      @supplies[item] += qty
    end
  end

  def can_build?(craft)
    can_build = nil
    supplies_required_strings = {}
    craft.supplies_required.each_pair do |key, value|
      supplies_required_strings[key.to_s] = value
    end
    supplies_required_strings.each_pair do |key, value|
      @supplies.keys.include?(key) ? can_build = true : can_build = false
      @supplies.each_pair do |k, v|
        (k == key) && (v >= value) ? can_build = true : can_build = false
      end
    end
    can_build
  end
end
