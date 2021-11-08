require './lib/person'
require './lib/craft'
require './lib/event'

RSpec.describe Person do

  let(:person) {Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})}


  describe '#initialize' do
    it 'exists' do
      expect(person).to be_instance_of Person
    end

    it 'has name' do
      expect(person.name).to eq 'Hector'
    end

    it 'has interests' do
      expect(person.interests).to eq(["sewing", "millinery", "drawing"])
    end

    it 'has supplies' do
      expect(person.supplies).to eq({})
    end
  end

  describe '#add_supply' do
    it 'adds argument to supplies hash' do
      person.add_supply('fabric', 4)
      person.add_supply('scissors', 1)

      expect(person.supplies).to eq({"fabric"=>4, "scissors"=>1})
    end

    it 'adds more of argument to supplies hash' do
      person.add_supply('fabric', 4)
      person.add_supply('scissors', 1)
      person.add_supply('fabric', 3)

      expect(person.supplies).to eq({"fabric"=>7, "scissors"=>1})
    end
  end

  describe '#can_build' do
    before(:each) do
      @hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})

      @toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})

      @sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})

      @knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})

      @event = Event.new("Carla's Craft Connection", [@sewing, @knitting], [@hector, @toni])
    end

    it "returns false if person doesn't have enough supplies" do
      expect(@hector.can_build?(@sewing)).to be false
    end

    it 'returns false even if person has supplies but still not enough' do
      @hector.add_supply('fabric', 7)
      @hector.add_supply('thread', 1)

      expect(@hector.can_build?(@sewing)).to be false
    end

    it 'returns true if person supplies match craft supplies' do
      @hector.add_supply('fabric', 7)
      @hector.add_supply('thread', 1)
      @hector.add_supply('scissors', 1)
      @hector.add_supply('sewing_needles', 1)

      expect(@hector.can_build?(@sewing)).to be true
    end
  end
end
