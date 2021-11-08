require './lib/person'
require './lib/craft'
require './lib/event'

RSpec.describe Person do
  before :each do
    @person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})

  end

  it 'exsists' do
    expect(@person).to be_an_instance_of(Person)
  end

  it 'has attributes' do
    expect(@person.name).to eq('Hector')
    expect(@person.interests).to eq(['sewing', 'millinery', 'drawing'])
    expect(@person.supplies).to eq({})
  end
end
