require './lib/event'
require './lib/craft'
require './lib/person'

RSpec.describe Event do
  it 'exists' do
    event = Event.new("Carla's Craft Connection", [craft], [person])

    expect(event).to be_instance_of Event
  end

  it 'initializes with a name, crafts, and attendees' do
    event = Event.new("Carla's Craft Connection", [craft], [person])

    expect(event.name).to eq("Carla's Craft Connection")
    expect(event.crafts).to eq(craft)
    expect(event.attendees).to eq(person)
  end
end
