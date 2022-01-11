require './lib/person'

describe Person do
  before(:each) do
    @person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
  end

  describe 'initialize' do
    it 'exisits' do
      expect(@person).to be_a(Person)
    end
    it 'has attributes' do
      expect(@person.name).to eq('Hector')
      expect(@person.interests).to eq(['sewing', 'millinery', 'drawing'])
      expect(@person.supplies).to eq({})
    end

    it 'can add supplies' do
      person.add_supply('fabric', 4)
      person.add_supply('scissors', 1)
    end
  end
end
