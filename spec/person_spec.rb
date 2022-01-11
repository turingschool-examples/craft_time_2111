require './lib/person'
require 'pry'
RSpec.describe Person do
  it 'exists' do
    person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    # binding.pry
    expect(person).to be_a(Person)
  end

  it 'has a name' do
    person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    # binding.pry
    expect(person.name).to eq("Hector")
  end

  it 'has interests' do
    person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    # binding.pry
    expect(person.interests).to eq(["sewing", "millinery", "drawing"])
  end

  it 'has empty hash of supplies' do
    person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    # binding.pry
    expect(person.supplies).to eq({})
  end

  it 'can add supplies to hash' do
    person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    # binding.pry
    person.add_supply('fabric', 4)
    person.add_supply('scissors', 1)
    expect(person.supplies).to eq({"fabric"=>4, "scissors"=>1})
    person.add_supply('fabric', 3)
    expect(person.supplies).to eq({"fabric"=>7, "scissors"=>1})
  end


end
