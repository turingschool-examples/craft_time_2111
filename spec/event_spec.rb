require './lib/person'
require './lib/craft'
require './lib/event'

RSpec.describe Event do
  before(:each) do
    @person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    @craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    @event = Event.new("Carla's Craft Connection", [@craft], [@person])
  end

  it 'exists' do
    expect(@event).to be_instance_of Event
  end

  it 'has attributes' do
    expect(@event.name).to eq("Carla's Craft Connection")
    expect(@event.crafts).to eq([@craft])
    expect(@event.attendees).to eq([@person])
  end
end

RSpec.describe Event do
  before(:each) do
    @hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    @toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
    @sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
    @knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    @event = Event.new("Carla's Craft Connection", [@sewing, @knitting], [@hector, @toni])
  end

  it '#attendee names' do
    expect(@event.attendee_names).to eq(["Hector", "Toni"])
  end

  it '#craft_with_most_supplies' do
    expect(@event.craft_with_most_supplies).to eq("sewing")
  end

  it '#supply_list' do
    expect(@event.supply_list).to eq(["fabric", "scissors", "thread", "sewing_needles", "yarn", "knitting_needles"])
  end

  it '#can_build?' do
    expect(@hector.can_build?(@sewing)).to eq(false)
  end

  it '#can_build?' do
    @hector.add_supply('fabric', 7)
    @hector.add_supply('thread', 1)
    expect(@hector.can_build?(@sewing)).to eq(false)
  end

  it '#can_build?' do
    @hector.add_supply('fabric', 7)
    @hector.add_supply('thread', 1)
    @hector.add_supply('scissors', 1)
    @hector.add_supply('sewing_needles', 1)
    expect(@hector.supplies).to eq({"fabric"=>7, "thread"=>1, "scissors"=>1, "sewing_needles"=>1})
      # require 'pry'; binding.pry
    expect(@hector.can_build?(@sewing)).to eq(true)
  end
end

RSpec.describe Event do
  before(:each) do
    @hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    @toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
    @tony = Person.new({name: 'Tony', interests: ['drawing', 'knitting']})
    @knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    @sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1})
    @painting = Craft.new('painting', {canvas: 1, paint_brush: 2, paints: 5})
    @event = Event.new("Carla's Craft Connection", [@knitting, @painting, @sewing], [@hector, @toni, @tony])
  end

  it `#attendees_by_craft_interest` do
    require 'pry'; binding.pry
    expect(@event.attendees_by_craft_interest).to be_instance_of(Hash)
    expect(@event.attendees_by_craft_interest.keys).to include("knitting")
    expect(@event.attendees_by_craft_interest.keys).to include("sewing")
    expect(@event.attendees_by_craft_interest.values).to be_instance_of(Array)
  end
end
