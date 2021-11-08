require './lib/person'
require './lib/craft'
require './lib/event'

RSpec.describe Event do

  before(:each) do
    @craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    @person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    @event = Event.new("Carla's Craft Connection", [@craft], [@person])
  end

  it 'exists' do
    expect(@event).to be_instance_of(Event)
  end

  it 'has attributes' do
    expect(@event.name).to eq("Carla's Craft Connection")
  end

  it 'adds craft and attendee from argument to craft and attendee arrays' do
    expect(@event.crafts).to eq([@craft])
    expect(@event.attendee_names).to eq([@person])
  end

  it 'returns craft with the most supplies needed' do
    hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
    sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
    knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    event = Event.new("Carla's Craft Connection", [sewing, knitting], [hector, toni])
    expect(event.attendee_names).to eq([hector, toni])
    expect(event.craft_with_most_supplies).to eq("sewing")
    expect(event.supply_list).to eq(["fabric", "scissors", "thread", "sewing_needles", "yarn", "knitting_needles"])
  end

  xit '#attendees_by_craft_interest' do
    hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
    tony = Person.new({name: 'Tony', interests: ['drawing', 'knitting']})
    knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1})
    painting = Craft.new('painting', {canvas: 1, paint_brush: 2, paints: 5})
    event = Event.new("Carla's Craft Connection", [knitting, painting, sewing], [hector, toni, tony])
    expect(event.attendees_by_craft_interest).to eq({"knitting" => [toni, tony], "painting" => [], "sewing" => [hector, toni]})
  end

end
