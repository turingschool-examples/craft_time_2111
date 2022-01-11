
require 'pry'
class Person
  attr_reader :name, :interests
  attr_accessor :supplies
  def initialize(hash)
    @name = hash[:name]
    @interests = hash[:interests]
    @supplies = Hash.new { |h, k| h[k] = 0 }
  end

  def add_supply(name, quantity)
    @supplies[name] += quantity
  end

  def can_build?(craft)
    return false if @supplies.empty?
    result = 0
    craft.supplies_required.each do |key, value|
      @supplies.each do |supply|
        if key.to_s == supply[0] && supply[1] >= value
          true
        elsif key.to_s != supply[0]
          next
        else
          result += 1
        end
      end
    end
    result ? true: false
  end
end
