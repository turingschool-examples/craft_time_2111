class Craft
  attr_reader :name, :supplies_required

  def initialize(name, supplies_required)
    @name = name
    @yarn = supplies_required[:yarn]
    @scissors = supplies_required[:scissors]
    @knitting_needles = supplies_required[:knitting_needles]
  end
end
