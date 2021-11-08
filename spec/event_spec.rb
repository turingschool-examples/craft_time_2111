require './lib/person'
require './lib/craft'
require './lib/event'

describe Event do
  before(:each) do
    @hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    @toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
    @knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    @sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
    @event = Event.new("Carla's Craft Connection", [@knitting, @sewing], [@hector, @toni])
  end

  describe '#initialize' do
    it 'exists' do
      expect(@event).to be_instance_of(Event)
    end

    it 'has a name' do
      expect(@event.name).to eq("Carla's Craft Connection")
    end

    it 'has crafts' do
      expect(@event.crafts).to eq([@knitting, @sewing])
    end

    it 'has attendees' do
      expect(@event.attendees).to eq([@hector, @toni])
    end
  end

  describe '#attendee_names' do
    it 'lists attendee names' do
      expect(@event.attendee_names).to eq(["Hector", "Toni"])
    end
  end

  describe '#craft_with_most_supplies' do
    it 'returns craft name with most supplies' do
      expect(@event.craft_with_most_supplies).to eq("sewing")
    end
  end

  describe '#supplies_list' do
    it 'returns array of supplies' do
      expect(@event.supplies_list).to eq(["yarn", "scissors", "knitting_needles", "fabric", "thread", "sewing_needles"])
    end
  end
end
