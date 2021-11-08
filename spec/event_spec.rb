require './lib/person'
require './lib/craft'
require './lib/event'

RSpec.describe Event do

  let(:person) {Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})}

  let(:craft) {Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})}

  let(:event) {Event.new("Carla's Craft Connection", [craft], [person])}

  describe '#intialize' do
    it 'exists' do
      expect(event).to be_instance_of Event
    end

    it 'has name' do
      expect(event.name).to eq "Carla's Craft Connection"
    end

    it 'has crafts' do
      expect(event.crafts).to eq([craft])
    end

    it 'has attendees' do
      expect(event.attendees).to eq([person])
    end
  end

  describe '#Iteration 2 Tests' do
    before(:each) do
      @hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})

      @toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})

      @sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})

      @knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})

      @event = Event.new("Carla's Craft Connection", [@sewing, @knitting], [@hector, @toni])
    end

    describe '#attendee_names' do
      it 'returns array of attendee names' do
        expect(@event.attendee_names).to eq(["Hector", "Toni"])
      end
    end

    describe '#craft_with_most_supplies' do
      it 'returns the craft with the most supplies' do
        expect(@event.craft_with_most_supplies).to eq "sewing"
      end
    end

    describe '#supply_list' do
      it 'returns array of supplies needed for event' do
        expect(@event.supply_list).to eq(["fabric", "scissors", "thread", "sewing_needles", "yarn", "knitting_needles"])
      end
    end
  end

  describe 'Iteration 3 Tests' do
    before(:each) do
      @hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})

      @toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})

      @tony = Person.new({name: 'Tony', interests: ['drawing', 'knitting']})

      @knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})

      @sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1})

      @painting = Craft.new('painting', {canvas: 1, paint_brush: 2, paints: 5})

      @event = Event.new("Carla's Craft Connection", [@knitting, @painting, @sewing], [@hector, @toni, @tony])
    end

    describe '#crafts_that_use' do
      it 'returns array of crafts if supplies_required includes passed argument' do
        expect(@event.crafts_that_use("scissors")).to eq([@knitting, @sewing])
      end

      it 'returns empty array if no crafts use argument' do
        expect(@event.crafts_that_use("fire")).to eq([])
      end
    end
  end
end
