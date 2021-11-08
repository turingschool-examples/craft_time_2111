require './lib/person'
require './lib/craft'

RSpec.describe Person do

  before(:each) do
    @person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    @sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
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

  describe '#can_build?' do
    it 'returns true if the person has enough supplies' do
      @person.add_supply('fabric', 7)
      @person.add_supply('thread', 1)

      expect(@person.can_build?(@sewing)).to be false

      @person.add_supply('scissors', 1)
      @person.add_supply('sewing_needles', 1)

      expect(@person.can_build?(@sewing)).to be true
    end
  end
end
