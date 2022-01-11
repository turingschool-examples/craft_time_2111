require './lib/person'

RSpec.describe do
  it 'exists' do
    person = Person.new({ name: 'Hector', interests: %w[sewing millinery drawing] })
    expect(person).to be_a(Person)
  end

  it 'has a name' do
    person = Person.new({ name: 'Hector', interests: %w[sewing millinery drawing] })
    expect(person.name).to eq('Hector')
  end

  xit 'interests' do
    person = Person.new({ name: 'Hector', interests: %w[sewing millinery drawing] })
    expect(person.interests).to eq(%w[sewing millinery drawing])
  end

  xit 'no supplies' do
    person = Person.new({ name: 'Hector', interests: %w[sewing millinery drawing] })
    expect(person.supplies).to eq({})
  end
end
