require './lib/person'
require './lib/craft'
require './lib/event'

RSpec.describe Event do
  before(:each) do
    @event = Event.new("Carla's Craft Connection", [craft], [person])
  end

  it 'exists' do
    expect(@event).to be_a_instance_of(Event)
  end

end
