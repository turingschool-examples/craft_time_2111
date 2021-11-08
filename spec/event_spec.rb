require "rspec"
require "./lib/person"
require "./lib/craft"
require "./lib/event"

describe Event do
  let (:person) {Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})}
  let (:craft) {Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})}
  let (:event) {Event.new("Carla's Craft Connection", [craft], [person])}
  it 'exists' do
    expect(event).to be_an_instance_of(Event)
  end

  it 'attributes' do
    expect(event.name).to eq("Carla's Craft Connection")
    expect(event.crafts).to eq([craft])
    expect(event.attendees).to eq([person])
  end

  it 'can list attendees by name' do
    hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
    sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
    knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    event_1 = Event.new("Carla's Craft Connection", [sewing, knitting], [hector, toni])
    expect(event_1.attendee_names).to eq(["Hector", "Toni"])
  end

  it 'can find the craft with most supplies' do
    hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
    sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
    knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    event_1 = Event.new("Carla's Craft Connection", [sewing, knitting], [hector, toni])
    expect(event_1.craft_with_most_supplies).to eq('sewing')
  end

  it 'can find the craft supply list' do
    hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
    sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
    knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    event_1 = Event.new("Carla's Craft Connection", [sewing, knitting], [hector, toni])
    expect(event_1.supply_list).to eq(["fabric", "scissors", "thread", "sewing_needles", "yarn", "knitting_needles"])
  end

end
