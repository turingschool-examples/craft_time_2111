class Event
  attr_reader :name,
              :crafts,
              :attendees
  # require "pry" ; binding.pry
  @@craft
  def initialize(name, craft, person)
    @name = name
    # require "pry" ; binding.pry
    @crafts = craft
    @attendees = person
  end

  # def self.access_crafts(craft)
  #   require "pry" ; binding.pry
  # end
  #
  # def self.access_attendees
  #   attendees = [@@person]
  # end
end
