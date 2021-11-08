require './lib/event'
require './lib/craft'
require './lib/person'

RSpec.describe 'Event' do
  it 'exists' do
    event = Event.new("Carla's Craft Connection", [craft], [person])
    expect(event).to be_an_instance_of(Event)
  end

  it 'has a name' do
    event = Event.new("Carla's Craft Connection", [craft], [person])
    expect(event.name).to eq("Carla's Craft Connection")
  end

  it 'has crafts' do
    event = Event.new("Carla's Craft Connection", [craft], [person])
    craft = Craft.new('knitting', { yarn: 20, scissors: 1, knitting_needles: 2 })
    expect(event.crafts).to be_an_instance_of(Craft)
  end

  it 'has attendees' do
    event = Event.new("Carla's Craft Connection", [craft], [person])
    person = Person.new({ name: 'Hector', interests: %w[sewing millinery drawing] })
    expect(event.attendees).to be_an_instance_of(Person)
  end
end
