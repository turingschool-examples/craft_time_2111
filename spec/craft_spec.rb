require './lib/craft'

Rspec.describe Craft do
  before(:each) do
    @craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
  end

 xit 'exists' do
  expect(@craft).to be_instance_of Craft
 end

 xit "has a name" do
   expect(@craft.name).to be_instance_of String
   expect(@craft.name).to eq("knitting")
 end

 xit "has supplies required" do
   expect(@craft.supplies_required).to be_instance_of Hash
   expect(@craft.supplies_required).to eq({:yarn=>20, :scissors=>1, :knitting_needles=>2})
 end
end
