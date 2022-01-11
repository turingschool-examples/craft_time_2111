require './lib/person'
require './lib/craft'
require './lib/event'
RSpec.describe Event do
  before(:each) do
    @person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    @craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    @event = Event.new("Carla's Craft Connection", [@craft], [@person])
  end
  it 'exists' do

    # binding.pry
    expect(@event).to be_a(Event)
  end

  it 'has a name' do
    expect(@event.name).to eq("Carla's Craft Connection")
  end

  it 'has array of crafts' do
    expect(@event.crafts).to eq([@craft])
  end

  it 'has array of attendees' do
    expect(@event.attendees).to eq([@person])
end
