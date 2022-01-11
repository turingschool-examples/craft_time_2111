require './lib/craft'

 RSpec.describe Craft do
 	before(:each) do
 		@craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
 	end

 	it 'is initialized with a name and a hash of required supplies' do
 		expect(@craft).to be_instance_of Craft
 		expect(@craft.name).to be_instance_of String
 		expect(@craft.supplies_required).to be_instance_of Hash
 	end
 end
