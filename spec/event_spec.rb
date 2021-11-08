require './lib/person'
require './lib/craft'
require './lib/event'

describe Event do
  before(:each) do
    @event = Event.new("Carla's Craft Connection", [craft], [person])
  end

  describe '#initialize' do
    it 'returns an instance of Event' do
      expect(@event).to be_a Event
    end

    it 'stores and returns the events name' do
      expect(@event.name).to eq("Carla's Craft Connection")
    end

    it 'returns the crafts at the event' do
      expect(@event.name).to eq([craft])
    end

    it 'returns the attendees' do
      expect(@event.attendees).to eq([person])
    end
  end

  describe '#add_supply & #supplies' do
    it 'adds supplies and #supplies returns the changes' do
      @person.add_supply('fabric', 4)
      @person.add_supply('scissors', 1)
      expect(@person.supplies).to eq({"fabric"=>4, "scissors"=>1})
    end
  end
end
