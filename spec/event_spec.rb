require './lib/person'
require './lib/craft'
require './lib/event'

describe Craft do
  before(:each) do
    @hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    @toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
    @sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
    @knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    @event = Event.new("Carla's Craft Connection", [@sewing, @knitting], [@hector, @toni])
  end

  it 'exists' do
    expect(@event).to be_a(Event)
  end

  it 'has a name' do
    expect(@event.name).to eq("Carla's Craft Connection")
  end

  it 'has crafts' do
    expect(@event.crafts).to be_a(Array)
    expect(@event.crafts[0]).to eq(@sewing)
  end

  it 'has attendees' do
    expect(@event.attendees).to be_a(Array)
    expect(@event.attendees[0]).to eq(@hector)
  end

  it 'has attendees names' do
    expect(@event.attendee_names).to eq(["Hector", "Toni"])
  end

  it 'finds craft with most supplies' do
    expect(@event.craft_with_most_supplies).to eq(@sewing)
  end

  it 'has all supplies' do
    expect(@event.supply_list).to eq(["fabric", "scissors", "thread", "sewing_needles", "yarn", "knitting_needles"])
  end

  
end
