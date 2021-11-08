require './lib/person'

RSpec.describe 'Person' do
  it 'exists' do
    hector = Person.new({ name: 'Hector', interests: %w[sewing millinery drawing] })
    expect(hector).to be_an_instance_of(Person)
  end

  it 'has a name' do
    hector = Person.new({ name: 'Hector', interests: %w[sewing millinery drawing] })
    expect(hector.name).to eq('Hector')
  end

  it 'has interests' do
    hector = Person.new({ name: 'Hector', interests: %w[sewing millinery drawing] })
    expect(hector.interests).to eq(%w[sewing millinery drawing])
  end

  it 'has no supplies' do
    hector = Person.new({ name: 'Hector', interests: %w[sewing millinery drawing] })
    expect(hector.supplies).to eq({})
  end

  it 'has supplies' do
    hector = Person.new({ name: 'Hector', interests: %w[sewing millinery drawing] })
    hector.add_supply('fabric', 4)
    hector.add_supply('scissors', 1)
    expect(hector.supplies).to eq({ 'fabric' => 4, 'scissors' => 1 })
  end
end
