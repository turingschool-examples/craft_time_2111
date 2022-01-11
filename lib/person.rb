class Person
  attr_reader :name,
              :interests,
              :supplies

  def initialize(info)
    @name = info.fetch(:name)
    @interests = info.fetch(:interests)
    @supplies = Hash.new(0)
  end

  def add_supply(name, qty)
    # require 'pry'; binding.pry
    @supplies[name] = @supplies[name] + qty
  end

  def can_build?(craft)
    a = craft.supplies_required.keys
    b = a.map do |key|
      key.to_s
    end
    (b - @supplies.keys).empty?
    # p craft.supplies_required.keys
  end
end
