equire './lib/event'

Rspec.describe Event do
  before(:each) do
    @event = Event.new("Carla's Craft Connection", [craft], [person])
  end

 xit 'exists' do
  expect(@event).to be_instance_of Event
 end

 xit "has a name" do
   expect(@event.name).to be_instance_of String
   expect(@event.name).to eq("Carla's Craft Connection")
 end

 xit "has a craft" do
   expect(@event.crafts).to be_instance_of Array
   expect(@event.crafts).to eq#([insert Craft here])
 end

 xit "has a attendees" do
   expect(@event.attendees).to be_instance_of Array
   expect(@event.attendees).to eq#([insert Person here])
 end

end
