class Person
  attr_reader :name,:supplies_required

  def initialize(info_hash)
    @name = info_hash[:name]
    @supplies_required = info_hash[:supplies_required]
  end
