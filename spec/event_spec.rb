require './lib/person'
require './lib/craft'
require './lib/event'
RSpec.describe Event do
  before :each do
    @person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    @craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    @event = Event.new("Carla's Craft Connection", [@craft], [@person])
    @event.add_craft(@craft)
    @event.add_attendees(@person)
  end
  it 'exists' do
    expect(@event).to be_an_instance_of(Event)
    expect(@event.name).to eq("Carla's Craft Connection")
  end
  it '#add_craft' do

    expect(@event.crafts).to eq([@craft])
  end
  it '#add_attendees' do

    expect(@event.attendees).to eq([@person])
  end
end
RSpec.describe Event do
  before :each do
  @hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
  @toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
  @sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
  @knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
  @event = Event.new("Carla's Craft Connection", [@sewing, @knitting], [@hector, @toni])
  @event.add_craft(@sewing)
  @event.add_craft(@knitting)
  @event.add_attendees(@hector)
  @event.add_attendees(@toni)
  end
  it "#event.attendee_names" do

    expect(@event.attendee_names).to eq(["Hector", "Toni"])
  end

  it '#craft_with_most_supplies' do

    expect(@event.craft_with_most_supplies).to eq("sewing")
  end

  it '#supply_list' do

    expect(@event.supply_list).to eq(["fabric", "scissors", "thread", "sewing_needles", "yarn", "knitting_needles"])
  end

  it '#can_build?' do

    expect(@hector.can_build?).to eq(false)
  end

  it '#add_supply and #can_build?' do
    @hector.add_supply('fabric', 7)
    @hector.add_supply('thread', 1)
    expect(@hector.can_build?).to eq(false)
  end
  it '#add_supply and #can_build?' do
    @hector.add_supply('scissors', 1)
    @hector.add_supply('sewing_needles', 1)
    expect(@hector.can_build?).to eq(true)
  end
end
