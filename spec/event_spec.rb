require 'rspec'
require './lib/person'
require './lib/craft'
require './lib/event'

describe Event do 
  let(:event) {Event.new("Carla's Craft Connection", [craft], [person])}
  let(:craft) {Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})}
  let(:person) {Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})}

  it 'exists' do
    expect(event).to be_an_instance_of(Event)
  end

  it 'attributes' do
    expect(event.name).to eq("Carla's Craft Connection")
    expect(event.crafts).to eq([craft])
    expect(event.attendees).to eq([person])
  end
end

describe 'iteration 2' do 
  let(:event) {Event.new("Carla's Craft Connection", [sewing, knitting], [hector, toni])}
  let(:hector) {Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})}
  let(:toni) {Person.new({name: 'Toni', interests: ['sewing', 'knitting']})}
  let(:sewing) {Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})}
  let(:knitting) {Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})}

  it '#attendee names' do 
    expect(event.attendee_names).to eq(["Hector", "Toni"])
  end
end