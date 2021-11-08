require './lib/person'

RSpec.describe Person do
  it 'exists' do
    person = Person.new({ name: 'Hector', interests: %w[sewing millinery drawing] })
    expect(person).to be_an_instance_of(Person)
  end
  it 'has a name' do
    person = Person.new({ name: 'Hector', interests: %w[sewing millinery drawing] })
    expect(person.name).to eq('Hector')
  end

  it 'has interests' do
    person = Person.new({ name: 'Hector', interests: %w[sewing millinery drawing] })
    expect(person.interests).to eq(%w[sewing millinery drawing])
  end

  it 'has no supplies' do
    person = Person.new({ name: 'Hector', interests: %w[sewing millinery drawing] })
    expect(person.supplies).to eq({})
end
end
