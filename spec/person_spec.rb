require './lib/person'
require './lib/craft'
require './lib/event'

describe Person do
  before(:each) do
    @hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    @sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
  end

  describe '#initialize' do
    it 'exists' do
      expect(@hector).to be_instance_of(Person)
    end

    it 'has a name' do
      expect(@hector.name).to eq('Hector')
    end

    it 'has interests' do
      expect(@hector.interests).to eq(['sewing', 'millinery', 'drawing'])
    end
  end

  describe '#add_supply' do
    it 'adds supplies' do
      @hector.add_supply('fabric', 4)
      @hector.add_supply('scissors', 1)
      @hector.add_supply('fabric', 3)
      expect(@hector.supplies).to eq({"fabric"=>7, "scissors"=>1})
    end
  end

  describe '#can_build?' do
    it 'returns a boolean based on supplies' do
      @hector.add_supply('fabric', 7)
      @hector.add_supply('thread', 1)
      @hector.add_supply('scissors', 1)
      @hector.add_supply('sewing_needles', 1)
      expect(@hector.can_build?(@sewing)).to eq(false)
    end
  end
end
