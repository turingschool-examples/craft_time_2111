require './lib/event'

RSpec.describe Event do

  before(:each) do
    @hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    @toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
    @sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
    @knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    @event = Event.new("Carla's Craft Connection", [@sewing, @knitting], [@hector, @toni])
  end

  describe '#initialize' do
    it 'has attributes' do
      expect(@event.name).to eq("Carla's Craft Connection")
      expect(@event.crafts).to eq([@sewing, @knitting])
      expect(@event.attendees).to eq([@hector, @toni])
    end
  end

  describe '#attendee_names' do
    it 'returns the names of people who participate in the event' do
      expect(@event.attendee_names).to eq(["Hector", "Toni"])
    end
  end

  describe '#craft_with_most_supplies' do
    it 'returns the craft with the most supplies' do
      expect(@event.craft_with_most_supplies).to eq("sewing")
    end
  end

  describe '#supply_list' do
    it 'returns the list of needed supplies for all crafts as an array' do
      expect(@event.supply_list).to eq(["fabric", "scissors", "thread", "sewing_needles", "yarn", "knitting_needles"])
    end
  end

end
