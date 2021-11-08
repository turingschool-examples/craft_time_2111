require './lib/person'
require './lib/craft'
require './lib/event'

RSpec.describe Event do
  before :each do
    @person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    @toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
    @tony = Person.new({name: 'Tony', interests: ['drawing', 'knitting']})
    @hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})


    @craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    @sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
    @knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})


    @event = Event.new("Carla's Craft Connection", [@craft], [@person])
    @event1 = Event.new("Carla's Craft Connection", [@sewing, @knitting], [@hector, @toni])
    @event2 = Event.new("Carla's Craft Connection", [@knitting, @painting, @sewing], [@hector, @toni, @tony])
  end

  it 'exists' do
    expect(@event).to be_an_instance_of(Event)
  end

  it 'has attributes' do
    expect(@event.name).to eq("Carla's Craft Connection")
    expect(@event.crafts).to eq([@craft])
    expect(@event.attendees).to eq([@person])
  end

  it '#attendee_names' do
    expect(@event1.attendee_names).to eq(['Hector', 'Toni'])
  end

  it '#craft_with_most_supplies' do
    expect(@event1.craft_with_most_supplies).to eq('sewing')
  end

  it '#supply_list' do
    expect(@event1.supply_list).to eq(["fabric", "scissors", "thread", "sewing_needles", "yarn", "knitting_needles"])
  end

  it '#attendees_by_craft_interest' do
    expected = {
      "knitting"=>[@toni,@tony],
      "painting"=>[],
      "sewing"=>[@hector, @toni]
    }
    expect(@event2.attendees_by_craft_interest).to eq(expected)
  end
end
