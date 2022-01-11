class Craft

  def initialize(hobby, supplies)
    @hobby = hobby
    @supplies = supplies
  end

  def name
    @hobby
  end

  def supplies_required
    @supplies
  end
end
