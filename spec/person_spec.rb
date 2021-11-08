require './lib/person'
require './lib/craft'
require './lib/event'

RSpec.describe Person do

  before(:each) do
    @person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    @sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
    @hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})

  end

  it 'exists' do
    expect(@person).to be_instance_of(Person)
  end

  it 'has attributes' do
    expect(@person.name).to eq("Hector")
    expect(@person.interests).to eq(['sewing', 'millinery', 'drawing'])
  end

  it 'has supplies hash' do
    expect(@person.supplies).to eq({})
  end

  it 'adds supplies to supplies hash' do
    @person.add_supply('fabric', 4)
    @person.add_supply('scissors', 1)
    # require "pry"; binding.pry
    expect(@person.supplies).to eq({"fabric"=>4, "scissors"=>1})
    @person.add_supply('fabric', 3)
    expect(@person.supplies).to eq({"fabric"=>7, "scissors"=>1})
  end

  it 'boolean for #can_build?' do
    expect(@hector.can_build?(@sewing)).to be(false)
    @hector.add_supply('fabric', 7)
    @hector.add_supply('thread', 1)
    expect(@hector.can_build?(@sewing)).to be(false)
    @hector.add_supply('scissors', 1)
    @hector.add_supply('sewing_needles', 1)
    # require "pry"; binding.pry
    expect(@hector.can_build?(@sewing)).to be(true)
  end

  


end
