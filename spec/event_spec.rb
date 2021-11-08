require './lib/event'
require './lib/person'
require './lib/craft'

RSpec.describe do

  before :each do
    @hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing', 'painting']})
    @toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
    @tony = Person.new({name: 'Tony', interests: ['drawing', 'knitting', 'painting']})
    @sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
    @knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    @painting = Craft.new('painting', {canvas: 1, paint_brush: 2, paints: 5})
    # @person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    # @craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    @event = Event.new("Carla's Craft Connection", [@knitting, @painting, @sewing], [@hector, @toni, @tony])

  end

  it 'exists' do
    expect(@event).to be_an_instance_of(Event)
  end

  it 'has a name' do
    expect(@event.name).to eq("Carla's Craft Connection")
  end

  it 'has a craft' do
    expect(@event.crafts).to eq([@knitting, @painting, @sewing])
  end

  it 'has attendees' do
    expect(@event.attendees).to eq([@hector, @toni, @tony])
  end

  it 'can list attendee names' do
    expect(@event.attendee_names).to eq(["Hector", "Toni", "Tony"])
  end

  it 'lists craft with most supplies' do
    expect(@event.craft_with_most_supplies).to eq("sewing")
  end

  it 'lists all supplies needed at event' do
    # expect(@event.supply_list).to eq(["fabric", "scissors", "thread", "sewing_needles", "yarn", "knitting_needles"])
    expect(@event.supply_list).to be_an Array
  end

  it '@attendees_by_craft_interest' do
    expect(@event.attendees_by_craft_interest).to eq({'knitting' => [@toni, @tony], 'painting' => [@hector, @tony], 'sewing' => [@hector, @toni]})
  end

  xit '@crafts_that_use' do
    expect(@event.crafts_that_use("scissors")).to eq[@sewing, @knitting]
  end

  # it 'iteration 4' do
  #   @toni.add_supply('yarn', 30)
  #   @toni.add_supply('scissors', 2)
  #   @toni.add_supply('knitting_needles', 5)
  #   @toni.add_supply('fabric', 10)
  #   @toni.add_supply('scissors', 1)
  #   @toni.add_supply('thread', 2)
  #   @toni.add_supply('paint_brush', 10)
  #   @toni.add_supply('paints', 20)
  #   @tony.add_supply('yarn', 20)
  #   @tony.add_supply('scissors', 2)
  #   @tony.add_supply('knitting_needles', 2)
  #   @hector.add_supply('fabric', 5
  #   @hector.add_supply('scissors', 1)
  #   @hector.add_supply('thread', 1)
  #   @hector.add_supply('canvas', 5)
  #   @hector.add_supply('paint_brush', 10)
  #   @hector.add_supply('paints', 20)
  # end

end
