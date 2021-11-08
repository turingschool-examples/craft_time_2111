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
      expect(@person.supplies).to eq({})
    end
  end

  describe '#add_supply' do
    it 'adds items to the supplies hash' do
      @person.add_supply('fabric', 4)
      @person.add_supply('scissors', 1)

      expect(@person.supplies).to eq({'fabric' => 4, 'scissors' => 1})

      @person.add_supply('fabric', 3)

      expect(@person.supplies).to eq({'fabric' => 7, 'scissors' => 1})
    end
  end
end
