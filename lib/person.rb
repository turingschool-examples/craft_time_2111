class Person
  attr_reader :name, :interests, :supplies
  def initialize(name_interests_hash)
    @name_interests_hash = name_interests_hash
    @name = @name_interests_hash[:name]
    @interests = @name_interests_hash[:interests]
    @supplies = Hash.new { |hash, key| hash[key] = 0 }
  end

  def add_supply(supply, amount)
    @supplies[supply] += amount
  end

  def can_build?(craft)
    if @supplies == {}
      false
    else
      @supplies.each do |supply, amount|
        binding.pry
        if craft.supplies_required.keys.find(supply.to_sym)
          amount >= craft.supplies_required[supply.to_sym]
        end
      end
    end
  end
end
