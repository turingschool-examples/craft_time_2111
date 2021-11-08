class Person
  attr_reader :name,
              :interests,
              :supplies

  def initialize(attributes)
    @name      = attributes[:name]
    @interests = attributes[:interests]
    @supplies  = Hash.new {|hash, key| hash[key] = 0}
  end

  def add_supply(item, value)
    @supplies[item] += value
  end

  # def can_build?(craft)
  #   supply_sym = @supplies.transform_keys {|key| key.to_sym}
  #   supply_sim.map do |sym, num|
  #     craft.supplies_required.map do |tool, needed|
  #       if sym == tool
  #         num >= needed
  #       else
  #         #Stalled out...dark times hahaha. Fun challenge :D
  #
  #   #require "pry"; binding.pry
  # end
end
