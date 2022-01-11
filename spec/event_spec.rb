require './lib/event'
require './lib/craft'
require './lib/person'

RSpec.describe Event do
  before(:each) do
    @person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    @craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    @event = Event.new("Carla's Craft Connection", [@craft], [@person])
  end
  it 'will make an instance of event' do
    expect(@event).to be_instance_of(Event)
  end
  it 'will read in the name of the event' do
    expect(@event.name).to eq("Carla's Craft Connection")
  end
  it 'will read in crafts' do
    expect(@event.crafts).to eq([@craft])
  end
  it 'crafts will be a craft object' do
    expect(@event.crafts.first).to be_instance_of(Craft)
  end
  it 'will read in attendees' do
    expect(@event.attendees).to eq([@person])
  end
  it 'will have each attendee be an instance of person' do
    expect(@event.attendees.first).to be_instance_of(Person)
  end
  describe 'iteration 2' do
    before(:each) do
      @hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
      @toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
      @sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
      @knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
      @event =  Event.new("Carla's Craft Connection", [@sewing, @knitting], [@hector, @toni])
    end
    it 'will find the attendees in an array form' do
      expect(@event.attendee_names).to eq(['Hector', 'Toni'])
    end
    it 'will return the craft with most supplies' do
      expect(@event.craft_with_most_supplies).to eq('sewing')
    end
    it 'will return all supplies' do
      expect(@event.supply_list).to eq(["fabric", "scissors", "thread", "sewing_needles", "yarn", "scissors", "knitting_needles"])
    end
    it 'will return if someone can build it' do
      # expect(@hector.can_build?(@sewing)).to be false
      @hector.add_supply('fabric', 7)
      @hector.add_supply('thread', 1)
      @hector.add_supply('scissors', 1)
      @hector.add_supply('sewing_needles', 1)
      expect(@hector.can_build?(@sewing)).to be true


    end
  end
end
