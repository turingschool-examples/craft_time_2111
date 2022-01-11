require 'rspec'
require 'pry'
require './lib/person'
require './lib/craft'
require './lib/event'

RSpec.describe Event do
  describe '#iteration 1' do
    it 'exists' do
      event = Event.new("Carla's Craft Connection", [:craft], [:person])

      expect(event).to be_a(Event) #spent about 45 minutes here. still couldnt figure it out.
    end

    it 'can read names' do
      event = Event.new("Carla's Craft Connection", [:craft], [:person])

      expect(event.name).to eq("Carla's Craft Connection")
    end

    it 'can list crafts' do
      event = Event.new("Carla's Craft Connection", [:craft], [:person])

      expect(event.crafts).to eq([knitting])
    end

    xit 'can list attendees' do
      event = Event.new("Carla's Craft Connection", [craft], [person])

      expect(event.attendies).to be_a(Array)
    end

    xit 'can add supplies' do
      event = Event.new("Carla's Craft Connection", [craft], [person])
      person.add_supply('fabric', 4)
      person.add_supply('scissors', 1)

      expect(person.supplies).to eq({"fabric"=>4, "scissors"=>1})
    end

    xit 'can add to existing supplies' do
      event = Event.new("Carla's Craft Connection", [craft], [person])

      person.add_supply('fabric', 4)
      person.add_supply('scissors', 1)
      person.add_supply('fabric', 3)
      expect(event).to be_a(Event)
    end
  end
end
