class Person

  attr_reader :name,
              :interests,
              :supplies

  def initialize(person_data)
    @name = person_data[:name]
    @interests = person_data[:interests]
    @supplies = Hash.new(0)
  end

  def add_supply(supply, amount)
    @supplies[supply] += amount
  end

  # def can_build?(craft)
  #   h1 = craft.supplies_required
  #   h2 = supplies
  #
  #   if h1.length != h2.length
  #     false
  #   elsif h1.keys != h2.keys
  #     false
  #   elsif
  #     h1.values.each do |h1value|
  #        h2.values.each do |h2value|
  #
  #     true
  #   end
  # end

end
