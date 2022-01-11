class Person
  attr_reader :name,
              :interests

  def initialize(info)
    @name = info.fetch(:name)
    @interests = info.fetch(:interests)
  end
end
