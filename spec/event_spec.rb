require 'pry'
require './lib/person'
require './lib/craft'
require './lib/event'

RSpec.describe Event do
  before(:each) do
    @event = Event.new("Carla's Craft Connection", [@sewing, @knitting, @painting], [@hector, @toni, @tony])
  end

  it "exists" do
    expect(@event).to be_a(Event)
  end

  it "has attributes" do
    expect(@event.name).to eq("Carla's Craft Connection")
    expect(@event.crafts).to eq([@sewing, @knitting, @painting])
    expect(@event.attendees).to eq([@hector, @toni, @tony])
  end


end
