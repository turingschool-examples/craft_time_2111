require './lib/person'
require './lib/craft'
require './lib/event'

RSpec.describe do
  it 'exists' do
    person = Person.new({ name: 'Hector', interests: %w[sewing millinery drawing] })
    expect(person).to be_a(Person)
  end

  it 'has a name' do
    person = Person.new({ name: 'Hector', interests: %w[sewing millinery drawing] })
    expect(person.name).to eq('Hector')
  end

  it 'interests' do
    person = Person.new({ name: 'Hector', interests: %w[sewing millinery drawing] })
    expect(person.interests).to eq(%w[sewing millinery drawing])
  end

  it 'no supplies' do
    person = Person.new({ name: 'Hector', interests: %w[sewing millinery drawing] })
    expect(person.supplies).to eq({})
  end

  it 'has supplies' do
    person = Person.new({ name: 'Hector', interests: %w[sewing millinery drawing] })
    person.add_supply('fabric', 4)
    person.add_supply('scissors', 1)
    expect(person.supplies).to eq({ 'fabric' => 4, 'scissors' => 1 })
    person.add_supply('fabric', 3)
    expect(person.supplies).to eq({ 'fabric' => 7, 'scissors' => 1 })
  end
end
