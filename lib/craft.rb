class Craft
  attr_reader :name
  def initialize(name, supplies_needed_hash)
    @name = name
    @supplies_needed_hash = supplies_needed_hash
  end
end
