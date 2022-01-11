require './lib/person'
require './lib/craft'
require './lib/event'

RSpec.describe Event do
  subject { Event.new("Carla's Craft Connection", [craft], [person]) }
  let(:craft) { Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})}
  let(:person) { Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']}) }
  let(:hector) { Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']}) }
  let(:toni)  { Person.new({name: 'Toni', interests: ['sewing', 'knitting']}) }
  let(:sewing) { Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1}) }
  let(:knitting) { Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2}) }
  let(:event) { Event.new("Carla's Craft Connection", [sewing, knitting], [hector, toni]) }

    it "exists" do
      expect(subject).to be_a Event
      expect(subject.name).to eq("Carla's Craft Connection")
      expect(subject.crafts).to eq([craft])
      expect(subject.attendees).to eq([person])
    end

  context "iteration-2" do

    it "shows #attendees_name" do
      expect(event.attendees_name).to eq(["Hector", "Toni"])
    end

    it "shows #craft_with_most_supplies" do
      expect(event.craft_with_most_supplies).to eq("sewing")
    end

     it "shows #supply_list" do
      expect(event.supply_list).to eq(["fabric", "scissors", "thread", "sewing_needles", "yarn", "knitting_needles"])
    end


  end
end
