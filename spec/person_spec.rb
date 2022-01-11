require './lib/person'

RSpec.describe Person do
  before(:each) do
    @person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
  end
  it 'will create an instance of person' do
    expect(@person).to be_instance_of(Person)
  end
  it 'will read in the name of a person' do
    expect(@person.name).to eq('Hector')
  end
  it 'will read in the interests of the person' do
    expect(@person.interests).to eq(['sewing', 'millinery', 'drawing'])
  end
  it 'will have an empty hash for supplies initially' do
    expect(@person.supplies).to eq({})
  end
  it 'will add supplies' do
    @person.add_supply('fabric', 4)
    @person.add_supply('scissors', 1)
    expect(@person.supplies).to eq({"fabric"=>4, "scissors"=>1})
    @person.add_supply('fabric', 3)
    expect(@person.supplies).to eq({"fabric"=>7, "scissors"=>1})
  end
end
