class Person
  attr_reader :name, :interests
  attr_accessor :supplies
  def initialize(info)
    @name = info[:name]
    @interests = info[:interests]
    @supplies = {}
  end

  def add_supply(supply, amount)
    if @supplies.has_key?(supply)
      @supplies[supply] += amount
    elsif
      @supplies[supply] = amount
    end
  end

  def can_build(craft)
    # supplies_req_array = craft.supplies_required.values
    # if @supplies.keys.map{|key| key.to_s.include?(craft.supplies_require.keys)}
    # require "pry"; binding.pry
  end

end
