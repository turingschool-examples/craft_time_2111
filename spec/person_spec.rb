require './lib/person'
require './lib/craft'

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
      @person.add_supply('fabric', 4)
      @person.add_supply('scissors', 1)
    end

    describe '#can_build?' do
      before(:each) do
        @hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
        @sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
      end
      it 'returns a boolean if person has supplies' do
        expect(@hector.can_build?(@sewing).to eq(false)
        @hector.add_supply('fabric', 7)
        @hector.add_supply('thread', 1)
        expect(@hector.can_build?(@sewing).to eq(false)
        @hector.add_supply('scissors', 1)
        @hector.add_supply('sewing_needles', 1)
        expect(@hector.can_build?(@sewing).to eq(true)
      end
    end
  end
end
