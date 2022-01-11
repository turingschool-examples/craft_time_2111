require "./lib/event"
require './lib/craft'
require './lib/person'
RSpec.describe Event do
  it "exists" do
    person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    event = Event.new("Carla's Craft Connection", [craft], [person])
    expect(event).to be_instance_of(Event)
  end

  it "has name" do
    person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    event = Event.new("Carla's Craft Connection", [craft], [person])
    expect(event.name).to eq("Carla's Craft Connection")
  end

  it "has crafts" do
    person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    event = Event.new("Carla's Craft Connection", [craft], [person])
    expect(event.crafts).to be_instance_of(Array)
  end

  it "has attendees" do
    person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    event = Event.new("Carla's Craft Connection", [craft], [person])
    expect(event.attendees).to be_instance_of(Array)
  end

  it "has event with most supplies" do
  hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
  toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
  sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
  knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
  event = Event.new("Carla's Craft Connection", [sewing, knitting], [hector, toni])
  expect(event.craft_with_most_supplies).to eq('sewing')
  end

  it "has supply list" do
  hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
  toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
  sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
  knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
  event = Event.new("Carla's Craft Connection", [sewing, knitting], [hector, toni])
  expect(event.supply_list).to eq(["fabric", "scissors", "thread", "sewing_needles", "yarn", "knitting_needles"])
  end
end
