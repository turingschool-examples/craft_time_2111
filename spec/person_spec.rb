require './lib/person'

describe Person do
  before(:each) do
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
end
