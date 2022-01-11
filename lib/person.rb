class Person
  attr_reader :name, :interests, :supplies

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @interests = attributes.fetch(:interests)
    @supplies = Hash.new(0)
  end

  def add_supply(object, count)
      @supplies[object] += count
    end
  end
