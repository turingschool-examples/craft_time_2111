require './lib/person'
require './lib/craft'
require './lib/event'

RSpec.describe Event do
  before(:each) do
    @hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    @craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    @event = Event.new("Carla's Craft Connection", [@craft], [@person])
    @event_1 = Event.new("Carla's Craft Connection", [@sewing, @knitting], [@hector, @toni])
    @toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
    @sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
    @knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
  end

  it 'exists' do
    expect(@event).to be_an_instance_of(Event)
  end

  it '#attributes' do
    expect(@event.name).to eq("Carla's Craft Connection")
    expect(@event.crafts).to eq(@craft)
    expect(@event.attendees).to eq([@hector])
  end

  it '#craft_with_most_supplies' do
    @event_1 = Event.new("Carla's Craft Connection", [@sewing, @knitting], [@hector, @toni])
    expect(@event_1.attendee_names).to eq(["Hector", "Toni"])
  end
end