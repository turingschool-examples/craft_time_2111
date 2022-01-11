class Event
  attr_reader :name,
              :craft,
              :person

  def initialize(name, craft, person)
    @name = name
    @@crafts = [craft]
    @@person = [person]
  end
end
