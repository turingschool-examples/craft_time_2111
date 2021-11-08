class Craft

  attr_reader :name, :required_supplies

  def initialize(craft_name, required_supplies)
    @name = craft_name
    @required_supplies = required_supplies
  end

end
