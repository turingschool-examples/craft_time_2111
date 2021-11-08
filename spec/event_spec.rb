require './lib/event'
require './lib/person'
require './lib/craft'

describe Event do
  it 'exists' do
    person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    event = Event.new("Carla's Craft Connection", craft, person)

    expect(event).to be_a Event
    expect(event.name).to eq ("Carla's Craft Connection")
    expect(event.craft).to eq (craft)
    expect(event.person).to eq (person)
  end
end
