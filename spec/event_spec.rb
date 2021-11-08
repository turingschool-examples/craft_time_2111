require 'rspec'
require './lib/person'
require './lib/craft'
require './lib/event'

RSpec.describe Event do
  it 'exists' do
    event = Event.new("Carla's Craft Connection", [craft], [person])

    expect(event).to be_instance_of(Event)
  end

  it 'has a name' do
    event = Event.new("Carla's Craft Connection", [craft], [person])

    expect(event.name).to eq("Carla's Craft Connection")
  end

  xit 'has crafts' do
    event = Event.new("Carla's Craft Connection", [craft], [person])

    expect(event.craft).to eq(craft.name)
  end

end
