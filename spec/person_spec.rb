require './lib/person'

RSpec.describe Person do

  before(:each) do
    @person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
  end

  describe '#initialize' do
    it 'has attributes' do
      expect(@person.name).to eq("Hector")
      expect(@person.interests).to eq(["sewing", "millinery", "drawing"])
      expect(@person.supplies).to eq({})
    end
  end

  describe '#add_supply' do
    it 'adds supplies to the persons supplies attribute' do
      @person.add_supply('fabric', 4)
      @person.add_supply('scissors', 1)
      expect(@person.supplies).to eq({"fabric"=>4, "scissors"=>1})
      @person.add_supply('fabric', 3)
      expect(@person.supplies).to eq({"fabric"=>7, "scissors"=>1})
    end
  end

  describe '#can_build?' do
    it 'returns a boolean if they have enought supplies for a given craft' do
      expect(@hector.can_build?(@sewing)).to eq(false)
      @hector.add_supply('fabric', 7)
      @hector.add_supply('thread', 1)
      expect(@hector.can_build?(@sewing)).to eq(false)
      @hector.add_supply('scissors', 1)
      @hector.add_supply('sewing_needles', 1)
      expect(@hector.can_build?(@sewing)).to eq(true)
    end
  end



end
