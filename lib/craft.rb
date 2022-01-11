class Craft
  attr_reader :name
  def initialize(name, info)
    @name = name
    @info = info
  end

  def supplies_required
    @info
  end
end
