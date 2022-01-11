require './lib/event'
require './lib/craft'
require './lib/person'

 RSpec.describe Event do
 	before(:each) do
		person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
		craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})

 		@event = Event.new("Carla's Craft Connection", [craft], [person])
 	end

 	it 'is initialized with a name, an array of craft objects, an array of people objects.' do
 		expect(@event).to be_instance_of Event
 		expect(@event.name).to be_instance_of String
 		expect(@event.crafts).to be_instance_of Array
 		expect(@event.attendees).to be_instance_of Array
 	end
 end
