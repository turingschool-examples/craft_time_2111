require './lib/event'
require './lib/craft'
require './lib/person'
require 'pry'

RSpec.describe Event do
  let(:person) {Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})}
  let(:craft) {Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})}
  let(:event) {Event.new("Carla's Craft Connection", [craft], [person])}


  it 'exists' do
    expect(event).to be_a Event
  end

  it 'has a name' do
    expect(event.name).to eq("Carla's Craft Connection")
    # expect(event.crafts).to eq()
    # expect(event.attendees).to eq()
  end

  it "has attendees" do
  expect(event.attendees).to eq([person])
end

end
