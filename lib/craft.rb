class Craft
  attr_reader :name,:supplies_required

  def initialize(name, info_hash)
    @name = name
    @supplies_required = info_hash
  end
end
