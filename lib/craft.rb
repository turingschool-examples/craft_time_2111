class Craft

  attr_reader :name, :supplies_required

  def initialize(craft_name, supplies_required)
    @name = craft_name
    @supplies_required = supplies_required
  end

end
