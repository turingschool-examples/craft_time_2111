require './lib/person'
require './lib/craft'
require './lib/event'

RSpec.describe Event do
  subject { Event.new("Carla's Craft Connection", [craft], [person]) }
  let(:craft) { Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})}
  let(:person) { Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']}) }

  it "exists" do
    expect(subject).to be_a Event
    expect(subject.name).to eq("Carla's Craft Connection")
    expect(subject.crafts).to eq([craft])
    expect(subject.attendees).to eq([person])
  end
end
