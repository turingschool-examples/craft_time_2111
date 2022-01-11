require './lib/person'
require './lib/event'
require './lib/craft'
require 'pry'

RSpec.describe Event do #Iteration 1
  before(:each) do
    @craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    @person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    @event = Event.new("Carla's Craft Connection", [@craft], [@person])
  end

  it 'exists' do
    expect(@event).to be_instance_of Event
  end

  it 'has a name' do
    expect(@event.name).to eq "Carla's Craft Connection"
  end

  it 'has crafts' do
    expect(@event.crafts).to eq [@craft]
  end

  it 'has attendees' do
    expect(@event.attendees).to eq [@person]
  end
end

RSpec.describe Event do #Iteration 2
  before(:each) do
    @hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    @toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
    @sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
    @knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    @event = Event.new("Carla's Craft Connection", [@sewing, @knitting], [@hector, @toni])
  end

  it 'gives attendee names' do
    expect(@event.attendee_names).to eq ["Hector", "Toni"]
  end

  it 'names the craft with the most supplies' do
    expect(@event.craft_with_most_supplies).to eq "sewing"
  end

  it 'gives a supply list for the event' do
    expect(@event.supply_list).to eq ["fabric", "scissors", "thread", "sewing_needles", "yarn", "knitting_needles"]
  end

  it 'tells if an attendee can participate in a craft' do
    expect(@hector.can_build?(@sewing)).to be false

    @hector.add_supply('fabric', 7)
    @hector.add_supply('thread', 1)

    expect(@hector.can_build?(@sewing)).to be false

    @hector.add_supply('scissors', 1)
    @hector.add_supply('sewing_needles', 1)

    expect(@hector.can_build?(@sewing)).to be true
  end
end

RSpec.describe Event do #Iteration 3
  before(:each) do
    @hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    @toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
    @tony = Person.new({name: 'Tony', interests: ['drawing', 'knitting']})
    @knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    @sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1}) #no more sewing needles?
    @painting = Craft.new('painting', {canvas: 1, paint_brush: 2, paints: 5})
    @event = Event.new("Carla's Craft Connection", [@knitting, @painting, @sewing], [@hector, @toni, @tony])
  end

  it 'groups attendees by craft interest' do
    expected = {
     "knitting"=>[@toni, @tony],
     "painting"=>[],
     "sewing"=>[@hector, @toni]
    }
    expect(@event.attendees_by_craft_interest).to eq expected
  end

  it 'lists crafts that require a certain supply' do
    expect(@event.crafts_that_use('scissors')).to eq [@knitting, @sewing]
    expect(@event.crafts_that_use('fire')).to eq []
  end
end

RSpec.describe Event do #Iteration 4
  before(:each) do
    @hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing', 'painting']})
    @toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
    @tony = Person.new({name: 'Tony', interests: ['drawing', 'knitting', 'painting']})
    @knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    @sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1}) #no more sewing needles?
    @painting = Craft.new('painting', {canvas: 1, paint_brush: 2, paints: 5})
    @toni.add_supply('yarn', 30)
    @toni.add_supply('scissors', 2)
    @toni.add_supply('knitting_needles', 5)
    @toni.add_supply('fabric', 10)
    @toni.add_supply('scissors', 1)
    @toni.add_supply('thread', 2)
    @toni.add_supply('paint_brush', 10)
    @toni.add_supply('paints', 20)
    @tony.add_supply('yarn', 20)
    @tony.add_supply('scissors', 2)
    @tony.add_supply('knitting_needles', 2)
    @hector.add_supply('fabric', 5)
    @hector.add_supply('scissors', 1)
    @hector.add_supply('thread', 1)
    @hector.add_supply('canvas', 5)
    @hector.add_supply('paint_brush', 10)
    @hector.add_supply('paints', 20)
    @event = Event.new("Carla's Craft Connection", [@knitting, @painting, @sewing], [@hector, @toni, @tony])
  end

  it 'assigns attendees to crafts' do #why are there two separate interaction patterns for this method in the readme?
    expected = {
      @knitting => [@toni, @tony],
      @painting => [@hector],
      @sewing => [@hector, @toni]
    }
    expect(@event.assign_attendees_to_crafts).to eq expected
  end
end
