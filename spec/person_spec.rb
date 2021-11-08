require './lib/person'

RSpec.describe Person do

  before(:each) do
    @person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
  end

  describe '#initialize' do
    it 'it exists' do
      expect(@person).to be_an_instance_of(Person)
    end

    it 'has attributes' do
      expect(@person.name).to eq('Hector')
      expect(@person.interests).to eq(['sewing', 'millinery', 'drawing'])
    end
  end
end
