require './lib/person'
require './lib/craft'
require './lib/event'

RSpec.describe Person do
  let(:person) {Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})}
  it 'exists' do
    actual = person
    expected = Person

    expect(actual).to be_a(expected)
  end
  describe '#attributes' do
    it 'has a name' do
      actual = person.name
      expected = 'Hector'

      expect(actual).to eq(expected)
  end
    it 'has interests' do
      actual = person.interests
      expected = ["sewing", "millinery", "drawing"]

      expect(actual).to eq(expected)
    end
    it 'has supplies' do
      actual = person.supplies
      expected = {}

      expect(actual).to eq(expected)
    end
  end
  describe '#add_supply/1' do
    it 'can add supplies' do
      sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
      person.add_supply('fabric', 4)
      person.add_supply('scissors', 1)
      actual = person.supplies
      expected = {"fabric"=>4, "scissors"=>1}

      expect(actual).to eq(expected)
    end
  end
  describe '#can_build?/1' do
    it 'says if they can build' do

      sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
      event = Event.new("Carla's Craft Connection", [sewing], [person])
      person.add_supply('thread', 1)
      person.add_supply('sewing_needles', 1)
      actual = person.can_build?(sewing)
      expected = false
      expect(actual).to eq(expected)
      person.add_supply('fabric', 5)
      person.add_supply('scissors', 1)
      actual = person.can_build?(sewing)
      expected = true
      expect(actual).to eq(expected)
    end
  end
end
