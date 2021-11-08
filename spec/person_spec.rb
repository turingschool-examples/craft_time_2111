require './lib/person'
require './lib/craft'
RSpec.describe Person do

  before(:each) do
    @person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    @sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
  end

  it 'is an instance of Person' do
    expect(@person).to be_instance_of(Person)
  end

  it 'can access name from inputted hash' do
    expect(@person.name).to eq("Hector")
  end

  it 'can access interests array' do
    expected_array = ["sewing", "millinery", "drawing"]
    expect(@person.interests).to eq(expected_array)
  end

  it 'can initialize empty supplies hash' do
    expect(@person.supplies).to eq({})
  end

  it 'can #add_supply to supplies hash' do
    @person.add_supply('fabric', 4)
    @person.add_supply('scissors', 1)
    @person.add_supply('fabric', 3)

    expect(@person.supplies).to eq({"fabric" => 7, "scissors" => 1})
  end

  it 'can #can_build a given craft (false)' do
    @person.add_supply('fabric', 7)
    @person.add_supply('thread', 1)
    expect(@person.can_build?(@sewing)).to be false
  end

  it 'can #can_build a given craft (true)' do
    @person.add_supply('fabric', 7)
    @person.add_supply('thread', 1)
    @person.add_supply('scissors', 1)
    @person.add_supply('sewing_needles', 1)

    expect(@person.can_build?(@sewing)).to be true
  end

end
