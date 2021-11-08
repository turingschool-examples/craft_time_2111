class Craft
  attr_accessor :name, :supplies_required

  def initialize(name, supplies_required)
    @name = name
    @supplies_required = supplies_required
  end
end
