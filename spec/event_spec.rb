require './lib/event'
require './lib/craft'
require './lib/person'
require 'rspec'

RSpec.describe Event do

  let(:event) {Event.new("Carla's Craft Connection", [craft], [person])}

  context 'iteration I' do

    it 'exists and has attributes' do

      expect(event.name).to eq("Carla's Craft Connection")
      expect (event.crafts).to eq([craft])
      expect(event.attendees).to eq([person])
    end
  end
end
