require './lib/person'

describe Person do
  before(:each) do
    @person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
  end

  describe '#initialize' do
    it 'exists' do
      expect(@person).to be_instance_of(Person)
    end

    it 'has a name' do
      expect(@person.name).to eq('Hector')
    end

    it 'has interests' do
      expect(@person.interests).to eq(['sewing', 'millinery', 'drawing'])
    end 
  end
end
