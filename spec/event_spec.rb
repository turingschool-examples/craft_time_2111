require './lib/person'
require './lib/craft'
require './lib/event'

RSpec.describe do
  it 'exists' do
    craft = Craft.new('knitting', { yarn: 20, scissors: 1, knitting_needles: 2 })
    person = Person.new({ name: 'Hector', interests: %w[sewing millinery drawing] })
    event = Event.new("Carla's Craft Connection", [craft], [person])
    expect(event).to be_a(Event)
  end

  it 'has a name' do
    craft = Craft.new('knitting', { yarn: 20, scissors: 1, knitting_needles: 2 })
    person = Person.new({ name: 'Hector', interests: %w[sewing millinery drawing] })
    event = Event.new("Carla's Craft Connection", [craft], [person])
    expect(event.name).to eq("Carla's Craft Connection")
  end

  it 'has crafts' do
    person = Person.new({ name: 'Hector', interests: %w[sewing millinery drawing] })
    craft = Craft.new('knitting', { yarn: 20, scissors: 1, knitting_needles: 2 })
    event = Event.new("Carla's Craft Connection", [craft], [person])
    expect(event.crafts).to eq([craft])
  end

  it 'has attendees' do
    craft = Craft.new('knitting', { yarn: 20, scissors: 1, knitting_needles: 2 })
    person = Person.new({ name: 'Hector', interests: %w[sewing millinery drawing] })
    event = Event.new("Carla's Craft Connection", [craft], [person])
    expect(event.attendees).to eq([person])
  end

  it 'has attendees' do
    hector = Person.new({ name: 'Hector', interests: %w[sewing millinery drawing] })
    toni = Person.new({ name: 'Toni', interests: %w[sewing knitting] })
    sewing = Craft.new('sewing', { fabric: 5, scissors: 1, thread: 1, sewing_needles: 1 })
    knitting = Craft.new('knitting', { yarn: 20, scissors: 1, knitting_needles: 2 })
    event = Event.new("Carla's Craft Connection", [sewing, knitting], [hector, toni])
    expect(event.attendee_names).to eq(%w[Hector Toni])
  end

  it 'know which craft has the most supplies' do
    hector = Person.new({ name: 'Hector', interests: %w[sewing millinery drawing] })
    toni = Person.new({ name: 'Toni', interests: %w[sewing knitting] })
    sewing = Craft.new('sewing', { fabric: 5, scissors: 1, thread: 1, sewing_needles: 1 })
    knitting = Craft.new('knitting', { yarn: 20, scissors: 1, knitting_needles: 2 })
    event = Event.new("Carla's Craft Connection", [sewing, knitting], [hector, toni])
    expect(event.craft_with_most_supplies).to eq('sewing')
  end

  it 'know which craft has the most supplies' do
    hector = Person.new({ name: 'Hector', interests: %w[sewing millinery drawing] })
    toni = Person.new({ name: 'Toni', interests: %w[sewing knitting] })
    sewing = Craft.new('sewing', { fabric: 5, scissors: 1, thread: 1, sewing_needles: 1 })
    knitting = Craft.new('knitting', { yarn: 20, scissors: 1, knitting_needles: 2 })
    event = Event.new("Carla's Craft Connection", [sewing, knitting], [hector, toni])
    expect(event.supply_list).to eq(%w[fabric scissors thread sewing_needles yarn knitting_needles])
  end
end
