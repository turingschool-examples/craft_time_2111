require './lib/event'
require 'pry'

RSpec.describe Craft do
  let(:event) {Event.new("Carla's Craft Connection", [craft], [person])}

  it 'exists' do
    expect(event).to be_a Event
  end

  xit 'has attributes' do
    expect(event.name).to eq("Carla's Craft Connection")
    expect(event.crafts).to eq()
    expect(event.attendees).to eq()
  end

end
