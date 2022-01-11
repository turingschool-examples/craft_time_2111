require './lib/person'
require './lib/craft'
require './lib/event'
require 'pry'

RSpec.describe Event do
  before(:each) do
    @event = Event.new("Carla's Craft Connection", [@crafts], [@person])
    @craft = Craft.new('Knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    @person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
  end

  it "exists and has retrievable attributes" do
    expect(@event).to be_a(Event)
    expect(@event.name).to eq("Carla's Craft Connection")
    expect(@event.crafts).to eq(Craft:0x00007fd37b818318...)
    expect(@event.attendees).to eq(Person:0x00007fd379b96028...)
  end
end
