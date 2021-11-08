require './lib/person'
require './lib/craft'

describe Person do
  before(:each) do
    @knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    @person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
  end

  it 'exists' do
    expect(@person).to be_a(Person)
  end

  it 'has a name' do
    expect(@person.name).to eq("Hector")
  end

  it 'has interests' do
    expect(@person.interests).to eq(['sewing', 'millinery', 'drawing'])
  end

  it 'has supplies' do
    expect(@person.supplies).to be_a(Hash)
  end

  it 'adds supplies' do
    @person.add_supply('fabric', 4)
    @person.add_supply('scissors', 1)

    expect(@person.supplies.count).to eq(2)
  end

  it 'determines if person can build a craft' do
    expect(@person.can_build?(@knitting)).to eq(false)

    @person.add_supply('yarn', 20)
    @person.add_supply('scissors', 1)
    @person.add_supply('knitting_needles', 2)

    expect(@person.can_build?(@knitting)).to eq(true)
  end
end
