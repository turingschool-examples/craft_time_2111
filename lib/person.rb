require 'pry'

class Person
  attr_reader :data, :person_name, :interests

  def initialize(data)
    @data = data
    # @person_name = []
  end

  def name
    @data.values.first
  end
end
# end
