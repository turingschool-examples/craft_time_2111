require './lib/event'
require './lib/craft'
require './lib/person'

RSpec.describe Event do
  before(:each) do
    craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    #only works because the craft instance variable is named craft, and is before @event
    @event = Event.new("Carla's Craft Connection", [craft], [person])
  end

 it 'exists' do
  expect(@event).to be_instance_of Event
 end

 it "has a name" do
   expect(@event.name).to be_instance_of String
   expect(@event.name).to eq("Carla's Craft Connection")
 end

 it "has a craft" do
   # craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
   expect(@event.crafts).to be_instance_of Array #return all crafts available in an event as an array
   expect(@event.crafts.first).to be_instance_of Craft
 end

 it "has attendees" do
   # person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
   expect(@event.attendees).to be_instance_of Array #return all attendees for an event as an array
   expect(@event.attendees.first).to be_instance_of Person
 end

end
