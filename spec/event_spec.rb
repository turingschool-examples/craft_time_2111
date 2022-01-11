require './lib/event'
require './lib/craft'
require './lib/person'

 RSpec.describe Event do
 	before(:each) do
		@hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    @toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})

    @sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
    @knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})

    @event = Event.new("Carla's Craft Connection", [@sewing, @knitting], [@hector, @toni])
 	end

 	it 'is initialized with a name, an array of craft objects, an array of people objects.' do
 		expect(@event).to be_instance_of Event
 		expect(@event.name).to be_instance_of String
 		expect(@event.crafts).to be_instance_of Array
 		expect(@event.attendees).to be_instance_of Array
 	end

	it 'can return an array of all the names of the attendees' do
    expect(@event.attendee_names).to be_instance_of Array
    expect(@event.attendee_names).to eq ["Hector", "Toni"]
	end

	it 'can return the name of the craft with the largest total quantity of supplies' do
		expect(@event.craft_with_most_supplies).to eq 'sewing'
	end

	it 'can return an array of all the supplies required for all the crafts in the event' do
		expect(@event.supply_list).to eq ["fabric", "scissors", "thread", "sewing_needles", "yarn", "knitting_needles"]
	end


	describe '#attendees_by_craft_interest' do
		before(:each) do
			@tony = Person.new({name: 'Tony', interests: ['drawing', 'knitting']})
			@painting = Craft.new('painting', {canvas: 1, paint_brush: 2, paints: 5})
      @event = Event.new("Carla's Craft Connection", [@knitting, @painting, @sewing], [@hector, @toni, @tony])
		end

    it 'can list all attendees by their interest in a craft' do
      expect(@event.attendees_by_craft_interest).to be_instance_of Hash
      expect(@event.attendees_by_craft_interest.count).to be 2
    end
	end

  describe '#crafts_that_use' do
    it 'returns all the crafts that require given item' do
      expect(@event.crafts_that_use('scissors')).to eq [@sewing, @knitting]
    end

    it 'returns an empty array if the item is not used by any craft' do
      expect(@event.crafts_that_use('fire')).to eq []
    end
  end
 end
