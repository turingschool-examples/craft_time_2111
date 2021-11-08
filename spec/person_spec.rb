require './lib/person'
require './lib/craft'

RSpec.describe Person do
  let(:person) { Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']}) }
  let(:hector) { Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']}) }
  let(:sewing) { Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1}) }
  let(:knitting) { Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2}) }

  describe '#initialize' do
    it 'exists' do
      expect(person).to be_a(Person)
    end

    it 'has a name' do
      expect(person.name).to eq('Hector')
    end

    it 'has interests' do
      expect(person.interests).to eq(['sewing', 'millinery', 'drawing'])
    end

    it 'has no supplies initially' do
      expect(person.supplies).to eq({})
    end
  end

  describe '#add_supply' do
    it 'can add supply name and quantity to the supplies hash' do
      person.add_supply('fabric', 4)
      person.add_supply('scissors', 1)
      
      expect(person.supplies).to eq({'fabric' => 4, 'scissors' => 1})
    end
    
    it 'can update supply names with added quantities' do
      person.add_supply('fabric', 4)
      person.add_supply('scissors', 1)
      person.add_supply('fabric', 3)
      
      expect(person.supplies).to eq({'fabric' => 7, 'scissors' => 1})
    end
  end

  describe '#can_build?' do
    it 'can not build if it does not have the supply and quantity to build' do
      expect(hector.can_build?(sewing)).to eq(false)
    end

    it 'can not build if it does not have the full supply list to build' do
      hector.add_supply('fabric', 7)
      hector.add_supply('thread', 1)
      
      expect(hector.can_build?(sewing)).to eq(false)
    end
    
    it 'can build if it has the full supply list to build' do
      hector.add_supply('fabric', 7)
      hector.add_supply('thread', 1)
      hector.add_supply('scissors', 1)
      hector.add_supply('sewing_needles', 1)
      
      expect(hector.can_build?(sewing)).to eq(true)
    end
  end
end