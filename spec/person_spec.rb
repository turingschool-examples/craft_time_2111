require './lib/person'
require './lib/craft'
require './lib/event'
RSpec.describe Person do
  before :each do
    @person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    @person.add_supply('fabric', 4)
    @person.add_supply('scissors', 1)
  end

  it 'exists' do

    expect(@person).to be_an_instance_of(Person)
    expect(@person.name).to eq("Hector")
    expect(@person.interests).to eq(["sewing", "millinery", "drawing"])
  end

  it '#add_supply' do

    expect(@person.supplies).to eq({"fabric"=>4, "scissors"=>1})
  end

  it '@add_supply again' do
    @person.add_supply('fabric', 7)

    expect(@person.supplies).to eq({"fabric"=>7, "scissors"=>1})
  end

end
