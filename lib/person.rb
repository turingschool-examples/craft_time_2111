class Person
  attr_reader :name,
              :interests,
              :supplies

  def initialize(info)
    @name = info.fetch(:name)
    @interests = info.fetch(:interests)
    @supplies = {}
  end
end
