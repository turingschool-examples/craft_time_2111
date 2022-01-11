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

    describe "It2" do
      it "checks the initialize" do
        hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
        toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
        sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
        knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
        event = Event.new("Carla's Craft Connection", [sewing, knitting], [hector, toni])
        expect(event.attendee_names).to eq(["Hector", "Toni"])
        expect(event.craft_with_most_supplies).to eq("sewing")
      end

      it "checks the initialize" do
        hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
        toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
        sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
        knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
        event = Event.new("Carla's Craft Connection", [sewing, knitting], [hector, toni])
        expect(event.supply_list).to eq(["fabric", "scissors", "thread", "sewing_needles", "yarn", "knitting_needles"])
        # expect(event.craft_with_most_supplies).to eq("sewing")
      end
    end
  end
end
