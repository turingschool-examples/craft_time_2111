require './lib/event'
require './lib/craft'
require './lib/person'
require 'pry'

RSpec.describe Event do
  let(:person) {Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})}
  let(:craft) {Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})}
  # let(:event) {Event.new("Carla's Craft Connection", [craft], [person])}
  let(:hector) {Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})}
  let(:toni) {Person.new({name: 'Toni', interests: ['sewing', 'knitting']})}
  let(:sewing) {Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})}
  let(:knitting) {Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})}
  let(:event) { Event.new("Carla's Craft Connection", [sewing, knitting], [hector, toni])}


  it 'exists' do
    expect(event).to be_a Event
  end

  it 'has a name' do
    expect(event.name).to eq("Carla's Craft Connection")
  end

  it 'has crafts' do
    expect(event.crafts).to eq([sewing, knitting])
  end

  it "has attendees" do
    expect(event.attendees).to eq([hector, toni])
  end

  it 'can add names' do

    expect(event.attendee_names).to eq(["Hector", "Toni"])
  end

end
