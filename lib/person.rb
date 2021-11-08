class Person

  attr_reader :name, :interests, :supplies

  def initialize(attributes)
    @name = attributes[:name]
    @interests = attributes[:interests]
    @supplies = Hash.new(0)
  end

  def add_supply(supply, quantity)
    @supplies[supply] = @supplies[supply] + quantity
  end


  def can_build?(craft)
    can_build = true

    craft.supplies_required.each do |supply|
      # require "pry"; binding.pry
      if @supplies[supply[0].to_s] < supply[1]
        # require "pry"; binding.pry
        can_build = false
      end
    end
    can_build
  end


end
