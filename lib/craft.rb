require 'pry'

class Craft
  attr_reader :name,
              :supplies_required

  def initialize(name, supplies_required)
    @name = name
    @supplies_required = supplies_required
  end

  def number_of_supplies
    @supplies_required.keys.length
  end

end
