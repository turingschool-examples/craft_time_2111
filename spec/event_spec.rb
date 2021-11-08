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

end
