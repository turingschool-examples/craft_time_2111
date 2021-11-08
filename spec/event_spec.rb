require './lib/event'
require './lib/craft'
require './lib/person'

RSpec.describe Event do
  it 'exists' do
    craft = Craft.new('knitting', { yarn: 20, scissors: 1, knitting_needles: 2 })
    person = Person.new({ name: 'Hector', interests: %w[sewing millinery drawing] })
    event = Event.new("Carla's Craft Connection", [craft], [person])
    expect(event).to be_an_instance_of(Event)
  end

  it 'has a name' do
    craft = Craft.new('knitting', { yarn: 20, scissors: 1, knitting_needles: 2 })
    person = Person.new({ name: 'Hector', interests: %w[sewing millinery drawing] })
    event = Event.new("Carla's Craft Connection", [craft], [person])
    expect(event.name).to eq("Carla's Craft Connection")
  end

  it 'has crafts' do
    craft = Craft.new('knitting', { yarn: 20, scissors: 1, knitting_needles: 2 })
    person = Person.new({ name: 'Hector', interests: %w[sewing millinery drawing] })
    event = Event.new("Carla's Craft Connection", [craft], [person])
    event.add_craft(craft)
    expect(event.crafts).to eq([craft])
  end

  it 'has attendees' do
    craft = Craft.new('knitting', { yarn: 20, scissors: 1, knitting_needles: 2 })
    person = Person.new({ name: 'Hector', interests: %w[sewing millinery drawing] })
    event = Event.new("Carla's Craft Connection", [craft], [person])
    event.add_craft(craft)
    event.add_attendees(person)
    expect(event.attendees).to eq([person])
  end
end
