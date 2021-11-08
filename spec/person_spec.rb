require './lib/person'
require './lib/craft'
require './lib/event'

RSpec.describe Person do

  it 'exists' do
    person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    expect(person).to be_instance_of(Person)
  end

  it 'name' do
    person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    # require "pry"; binding.pry
    expect(person.name).to eq("Hector")
  end

  it 'interests' do
    person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    expect(person.interests).to eq(["sewing", "millinery", "drawing"])
  end

  it 'supplies' do
    person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    expect(person.supplies).to eq({})
  end

  it 'supplies' do
    person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    expect(person.supplies).to eq({})
  end


  it 'add supplies' do
    person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    person.add_supply('fabric', 4)
    person.add_supply('scissors', 1)
    expect(person.supplies).to eq({"fabric"=>4, "scissors"=>1})
  end

  it 'add more supplies' do
    person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    person.add_supply('fabric', 4)
    person.add_supply('scissors', 1)
    person.add_supply('fabric', 3)
    expect(person.supplies).to eq({"fabric"=>7, "scissors"=>1})
  end


  it 'can build' do
    hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
    hector.add_supply('fabric', 4)
    hector.add_supply('scissors', 1)
    hector.add_supply('fabric', 3)
    expect(hector.can_build?(sewing)).to eq(false)
  end

  it 'can build - true' do
    hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
    hector.add_supply('fabric', 7)
    hector.add_supply('scissors', 1)
    hector.add_supply('thread', 1)
    hector.add_supply('scissors', 1)
    hector.add_supply('sewing_needles', 1)
    expect(hector.can_build?(sewing)).to eq(true)
  end



end
