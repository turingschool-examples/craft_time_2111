class Craft < Person
  attr_reader :name, :supplies_required

def initialize(name, supplies_required)
  @name = name
  super()
  @supplies_required = {yarn: 20, scissors: 1, knitting_needles: 2}
end
end
