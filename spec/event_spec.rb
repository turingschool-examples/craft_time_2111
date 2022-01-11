require './lib/event'
require './lib/craft'
require './lib/person'

RSpec.describe Event do
  before(:each) do
    @person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    @craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    @event = Event.new("Carla's Craft Connection", [@craft], [@person])
  end
  it 'will make an instance of event' do
    expect(@event).to be_instance_of(Event)
  end
  it 'will read in the name of the event' do
    expect(@event.name).to eq("Carla's Craft Connection")
  end
  it 'will read in crafts' do
    expect(@event.crafts).to eq([@craft])
  end
  it 'crafts will be a craft object' do
    expect(@event.crafts.first).to be_instance_of(Craft)
  end
  it 'will read in attendees' do
    expect(@event.attendees).to eq([@person])
  end
  it 'will have each attendee be an instance of person' do
    expect(@event.attendees.first).to be_instance_of(Person)
  end 
end
