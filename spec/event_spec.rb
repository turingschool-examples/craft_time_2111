require './lib/person'
require './lib/craft'
require './lib/event'

RSpec.describe Event do
  before(:each) do
    @person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    @craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    @event = Event.new("Carla's Craft Connection", [@craft], [@person])
  end

  it 'is an instance of Event' do
    expect(@event).to be_instance_of(Event)
  end

  it 'can access Even name' do
    expect(@event.name).to eq("Carla's Craft Connection")
  end

  it 'can list crafts in a given event' do
    expect(@event.crafts).to eq([@craft])
  end

  it 'can list attendees of a given event' do
    expect(@event.attendees).to eq([@person])
  end

end
