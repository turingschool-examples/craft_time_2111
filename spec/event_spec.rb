require './lib/event'
require './lib/person'

describe Event do
  before(:each) do
    @person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    @craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    @event = Event.new("Carla's Craft Connection", [@craft], [@person])
  end

  describe 'initialize' do
    it 'exists' do
      expect(@event).to be_a(Event)
    end
    it 'has attributes' do
      expect(@event.name).to eq("Carla's Craft Connection")
      expect(@event.crafts).to eq(@craft)
      expect(@event.name).to eq(@person)
    end
  end

  describe 'event methods' do
    before(:each) do
      @hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
      @toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
      @sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
      @knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
      @event = Event.new("Carla's Craft Connection", [sewing, knitting], [hector, toni])
    end
    describe '#attendee_names' do
      it 'returns an array of attendee names' do
        expect(@event.attendee_names).to eq(["Hector", "Toni"])
      end
    end

    describe '#craft_with_most_supplies' do
      it 'returns a string' do
        expect(@event.craft_with_most_supplies).to be_a(String)
      end
      it 'returns correct craft name' do
        expect(@event.craft_with_most_supplies).to eq("sewing")
      end
    end
     describe '#supply_list' do
       it 'returns supply list' do
         expected = ["fabric", "scissors", "thread", "sewing_needles", "yarn", "knitting_needles"]
         expect(@event.supply_list).to eq(expected)
       end
     end
  end
end
