require './lib/person'

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


end
