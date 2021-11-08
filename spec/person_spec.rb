require './lib/person'
require './lib/craft'
require './lib/event'


RSpec.describe Person do

  let(:person) {Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})}

  let(:craft) {Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})}

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
      expect(person.supplies).to eq {}
    end
  end

  describe '#add_supply' do
    it 'adds argument to supplies hash' do
      expect(person.supplies).to eq({"fabric"=>7, "scissors"=>1})
    end
  end


end
