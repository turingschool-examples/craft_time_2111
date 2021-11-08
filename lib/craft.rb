class Craft
  attr_reader :name, :supplies_required, :amount_of_supplies

  def initialize(name, supplies_required)
    @name               = name
    @supplies_required  = supplies_required
    @amount_of_supplies = supplies_required.count
  end

end
