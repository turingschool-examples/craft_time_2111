require './lib/person'
require './lib/craft'
require './lib/event'
require 'pry'

RSpec.describe Event do
  it 'exists and has a name' do
    person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    event = Event.new("Carla's Craft Connection", [craft], [person])

    expect(event).to be_an_instance_of(Event)
    expect(event.name).to eq("Carla's Craft Connection")
  end

  it "has start with no crafts and can crafts" do
    person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    event = Event.new("Carla's Craft Connection", [craft], [person])


    expect(event.crafts).to eq([])
    event.add_crafts(craft)
    expect(event.crafts).to eq([craft])
  end

  it "has a list of attendees" do
    person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    event = Event.new("Carla's Craft Connection", [craft], [person])

    expect(event.attendees).to eq([])
    event.add_attendees(person)
    expect(event.attendees).to eq([person])
  end

  it 'can list attendees by name' do
    hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
    sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
    knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    event = Event.new("Carla's Craft Connection", [sewing, knitting], [hector, toni])

    event.add_attendees(hector)
    event.add_attendees(toni)
    expect(event.attendee_names).to eq(["Hector", "Toni"])
  end
end
