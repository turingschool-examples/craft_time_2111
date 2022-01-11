require './lib/person'

 RSpec.describe Person do
 	before(:each) do
 		@person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
 	end

 	it 'is initialized with a hash of attributes' do
 		expect(@person).to be_instance_of Person
 		expect(@person.name).to be_instance_of String
 		expect(@person.interests).to be_instance_of Array
 	end

	it 'contains an empty hash of crafting supplies' do
		expect(@person.supplies).to be_instance_of Hash
		expect(@person.supplies).to be_empty
	end

	describe '#add_supplies' do
		before(:each) do
			@person.add_supply('fabric', 4)
			@person.add_supply('scissors', 1)
		end

		it 'adds a key/value pair of item => quantity to the supplies hash' do
			expect(@person.supplies.count).to be 2
			expect(@person.supplies['fabric']).to eq 4
			expect(@person.supplies['scissors']).to eq 1
		end
	end
 end
