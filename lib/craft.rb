class Craft
  attr_reader :name, :supplies_required

  def initialize(name, supplies_required)
    @name = name
    @supplies_required = {}
  end

  def add_supplies(supplies)
    @supplies_required.merge!(supplies)
  end
end
