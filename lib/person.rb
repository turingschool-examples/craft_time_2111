class Person
  attr_reader :name, :interests
  attr_accessor :supplies
  def initialize(about)
    @name = about[:name]
    @interests = about[:interests]
    @supplies = {}
  end

  def add_supply(supply, amount)

    if @supplies.has_key?(supply)
      @supplies[supply] += amount
    elsif
      @supplies[supply] = amount
    end
    @supplies
  end

  def can_build?(craft)
    craft_hash = craft.supplies_required.transform_keys(&:to_s)
    @supplies == craft_hash #and values supplies values >= required values
    # require "pry"; binding.pry
  end
end
