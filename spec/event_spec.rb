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
        expect(event.attendee_names).to eq(["Hector", "Toni"])
      end
    end
  end

end
