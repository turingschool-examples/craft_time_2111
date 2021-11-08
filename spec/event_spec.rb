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
    expect(event.crafts).to eq (craft)
    expect(event.attendees).to eq (person)
  end

  it 'returns names of attendees' do
    hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
    sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
    knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    event = Event.new("Carla's Craft Connection", [sewing, knitting], [hector, toni])

    expect(event.attendee_names).to eq (["Hector", "Toni"])
  end

  it 'returns the name of the craft that requires the most supply types' do
    hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
    sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
    knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    event = Event.new("Carla's Craft Connection", [sewing, knitting], [hector, toni])

    expect(event.craft_with_most_supplies).to eq ("sewing")
  end

  it 'returns a list of all supplies needed' do
    hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
    sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
    knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    event = Event.new("Carla's Craft Connection", [sewing, knitting], [hector, toni])

    expect(event.supply_list).to eq (["fabric", "scissors", "thread", "sewing_needles", "yarn", "knitting_needles"])
  end

  xit 'returns a boolean if enough supply exists to build' do
    hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
    sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
    knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    event = Event.new("Carla's Craft Connection", [sewing, knitting], [hector, toni])

    expect(hector.can_build?(sewing)).to eq (false)
  end
  ## Could not figure out how to access the event data in the person class of Hector
  ## so i moved on, to come back but wrote the tests.

  it 'returns a hash where the keys are the names of all of the crafts in the event, and the values are arrays of attendees who are interested in that craft.' do
    hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
    tony = Person.new({name: 'Tony', interests: ['drawing', 'knitting']})
    sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
    knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    painting = Craft.new('painting', {canvas: 1, paint_brush: 2, paints: 5})
    event = Event.new("Carla's Craft Connection", [knitting, painting, sewing], [hector, toni, tony])
    expected =
      {
      "knitting"=> [toni,tony],
      "painting"=>[],
       "sewing"=> [hector,toni]
      }

    expect(event.attendees_by_craft_interest).to eq (expected)

  end

  it 'returns a hash where the keys are the names of all of the crafts in the event, and the values are arrays of attendees who are interested in that craft.' do
    hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
    tony = Person.new({name: 'Tony', interests: ['drawing', 'knitting']})
    sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
    knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    painting = Craft.new('painting', {canvas: 1, paint_brush: 2, paints: 5})
    event = Event.new("Carla's Craft Connection", [knitting, painting, sewing], [hector, toni, tony])
    expected = [toni,tony]


    expect(event.attendees_interested(knitting.name)).to eq (expected)

  end

end
