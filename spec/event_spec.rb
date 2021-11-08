require './lib/person'
require './lib/craft'
require './lib/event'

RSpec.describe Event do
  before(:each) do
    @craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})

    @person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    @toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
    @event = Event.new("Carla's Craft Connection", [@craft], [@person])
  end

  it 'exists' do
    expect(@event).to be_instance_of(Event)
  end

  it 'has attributes' do
    expect(@event.name).to eq("Carla's Craft Connection")
    expect(@event.crafts).to eq([@craft])
    expect(@event.attendees).to eq([@person])
  end
end

##Iteration 2

RSpec.describe Event do
  before(:each) do
    @hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    @toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
    @sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
    @knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    @event = Event.new("Carla's Craft Connection", [@sewing, @knitting], [@hector, @toni])

  end

  it 'can list attendees by name' do
    expect(@event.attendee_names).to eq(["Hector", "Toni"])
  end

  it 'can find the craft with the most supplies' do
    expect(@event.craft_with_most_supplies).to eq("sewing")
  end

  it 'can list all the supplies for the event' do
    expect(@event.supply_list).to eq(["fabric", "scissors", "thread", "sewing_needles", "yarn", "knitting_needles"])
  end
end

### Iteration 3
RSpec.describe Event do
  before(:each) do
    @hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    @toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
    @tony = Person.new({name: 'Tony', interests: ['drawing', 'knitting']})
    @sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
    @knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    @painting = Craft.new('painting', {canvas: 1, paint_brush: 2, paints: 5})
    @event = Event.new("Carla's Craft Connection", [@knitting, @paiting, @sewing], [@hector, @toni, @tony])
  end

  it 'can organize attendees by craft interest' do
    expected = {"knitting" => [@toni, @tony], "painting" => [], "sewing" => [@hector, @toni]}
    expect(@event.attendees_by_craft_interest).to eq(expected)
  end

end
