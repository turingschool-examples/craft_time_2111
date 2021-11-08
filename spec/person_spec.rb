require './lib/person'
require './lib/craft'
require './lib/event'

RSpec.describe "Person"  do
  before(:each) do
    @person = Person.new({name: 'Hector',
                          interests: ['sewing', 'millinery', 'drawing']})
    @hector = Person.new({name: 'Hector',
                          interests: ['sewing', 'millinery', 'drawing']})
    @sewing = Craft.new('sewing', {fabric: 5,
                                   scissors: 1,
                                   thread: 1,
                                   sewing_needles: 1})
  end

  it "exists" do
    expect(@person).to be_a Person
  end

  it "has attributes" do
    expect(@person.name).to eq('Hector')
    expect(@person.interests).to eq(['sewing', 'millinery', 'drawing'])
    expect(@person.supplies).to eq({})
  end

  it "can add to the supply hash" do
    @person.add_supply('fabric', 4)
    @person.add_supply('scissors', 1)

    expect(@person.supplies).to eq({"fabric"=>4, "scissors"=>1})

    @person.add_supply('fabric', 3)

    expect(@person.supplies).to eq({"fabric"=>7, "scissors"=>1})
  end

  it "can tell if the person has enough supplies for the craft" do
    # expect(@hector.can_build?(@sewing)).to eq false

    @hector.add_supply('fabric', 7)
    @hector.add_supply('thread', 1)

    expect(@hector.can_build?(@sewing)).to eq false

    # @hector.add_supply('scissors', 1)
    # @hector.add_supply('sewing_needles', 1)
    #
    # expect(@hector.can_build?(@sewing)).to eq true
  end
end
