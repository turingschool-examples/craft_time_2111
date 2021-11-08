require './lib/person'
require './lib/craft'
require './lib/event'

describe Craft do
  before(:each) do
    @person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    @craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    @event = Event.new("Carla's Craft Connection", [@craft], [@person])
  end

  it 'exists' do
    expect(@event).to be_a(Event)
  end

  it 'has a name' do
    expect(@event.name).to eq("Carla's Craft Connection")
  end

  it 'has crafts' do
    expect(@event.crafts).to be_a(Array)
    expect(@event.crafts[0]).to eq(@craft)
  end

  it 'has attendees' do
    expect(@event.attendees).to be_a(Array)
    expect(@event.attendees[0]).to eq(@person)
  end


end
