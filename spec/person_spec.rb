require './lib/person'
require './lib/craft'
require './lib/event'


RSpec.describe Person do
  it "exists" do
    person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    expect(person).to be_instance_of(Person)
  end

  it "has attributes" do
      person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
      expect(person.name).to eq("Hector")
      expect(person.interests).to eq(["sewing", "millinery", "drawing"])
  end

  it "adds supply" do
    person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    person.add_supply('fabric', 4)
    person.add_supply('scissors', 1)
    expect(person.supplies).to eq({"fabric"=>4, "scissors"=>1})
  end
end
