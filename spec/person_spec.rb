require './lib/person'
require './lib/craft'


RSpec.describe do

  before :each do
    @person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
  end

  it 'exists' do
    expect(@person).to be_an_instance_of(Person)
  end

  it 'has a name' do
    expect(@person.name).to eq("Hector")
  end

  it 'has interests' do
    expect(@person.interests).to eq(['sewing', 'millinery', 'drawing'])
  end

  it 'by default has no supplies' do
    expect(@person.supplies).to eq({})
  end

  it 'can add supplies' do
    @person.add_supply('fabric', 4)
    @person.add_supply('fabric', 3)
    @person.add_supply('scissors', 1)

    expect(@person.supplies).to eq({'fabric' => 7, 'scissors' => 1})
  end

  it '#can_build false' do
    @sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})

    expect(@person.can_build?(@sewing)).to eq(false)
  end

  xit '#can_build true' do
    @sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
    @hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    @hector.add_supply('fabric', 7)
    @hector.add_supply('thread', 1)
    @hector.add_supply('scissors', 1)
    @hector.add_supply('sewing_needles', 1)
    require "pry"; binding.pry
    expect(@hector.can_build?(@sewing)).to eq(true)
  end


end
