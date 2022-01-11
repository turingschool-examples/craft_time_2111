require 'pry'

class Person
  attr_reader :data, :person_name, :supplies

  def initialize(data)
    @data = data
    @supplies = {}
    # @person_name = []
  end

  def name
    @data.values.first
  end

  def interests
    @data.values.last
  end
end
# end
