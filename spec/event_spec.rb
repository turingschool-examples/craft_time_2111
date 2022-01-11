require './lib/person'
require './lib/craft'
require './lib/event'

RSpec.describe Event do
let(:person) {Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})}
let(:craft) {Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})}
let(:event) {Event.new("Carla's Craft Connection", [craft], [person])}


  it 'exists and has attributes' do
    expect(event).to be_a(Event)
    expect(event.name).to eq("Carla's Craft Connection")
    expect(event.crafts).to eq([craft])
    expect(event.attendees).to eq([person])
  end


end
