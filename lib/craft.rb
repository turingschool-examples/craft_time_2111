class Craft
  attr_reader :name, :supplies_required
  def initialize(name, supplies_required_hash)
    @name = name
    @supplies_required = supplies_required_hash
  end
end
