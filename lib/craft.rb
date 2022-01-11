class Craft
  attr_reader :name
  def initialize(name, info)
    @name = name
    @info = info
  end

  def supplies_required
    @info.transform_keys(&:to_s)
  end
end
