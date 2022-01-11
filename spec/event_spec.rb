require './lib/person'
require './lib/craft'
require './lib/event'
require 'pry'
require 'RSpec'

RSpec.describe Event do
  describe "this will test the event class" do
    it "checks the initialize" do
      person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
      craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
      event = Event.new("Carla's Craft Connection", [craft], [person])
      expect(event.name).to eq("Carla's Craft Connection")
      expect(event.crafts).to eq([craft])
      expect(event.attendees).to eq([person])
    end
  end
end
