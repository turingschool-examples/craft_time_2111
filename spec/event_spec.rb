require './lib/person'
require './lib/craft'
require './lib/event'

RSpec.describe do Event

  it 'event class exists' do
    event = Event.new("Carla's Craft Connection", [craft], [person])
    expect(event).to be_an_instance_of(Event)
  end
end
