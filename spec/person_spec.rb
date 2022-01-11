require './lib/person'

Rspec.describe Person do
  before(:each) do
    @person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
  end

 xit 'exists' do
  expect(@person).to be_instance_of Person
 end

 xit "has a name" do
  expect(@person.name).to be_instance_of String
  expect(@person.name).to eq("Hector")
 end

 xit "has interests" do
  expect(@person.interests).to be_instance_of Array
  expect(@person.interests).to eq(["sewing", "millinery", "drawing"])
 end

 xit "has no supplies to start" do
  expect(@person.supplies).to be_instance_of Hash
  expect(@person.supplies).to eq({})
 end

 xit "adds supplies" do
   person.add_supply('fabric', 4)
   person.add_supply('scissors', 1)
   person.supplies
   expect(@person.supplies).to eq({"fabric"=>4, "scissors"=>1})

   person.add_supply('fabric', 3)
   person.supplies
   expect(@person.supplies).to eq({"fabric"=>7, "scissors"=>1})
 end

end
