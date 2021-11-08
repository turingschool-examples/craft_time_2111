require './lib/person'
require './lib/craft'
require './lib/event'

RSpec.describe Event do
  let(:person){Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})}
  let(:craft) {Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})}
  let(:event) {Event.new("Carla's Craft Connection", [craft], [person])}
  it 'exists' do
    actual = event
    expected = Event
    expect(actual).to be_a(expected)
  end
  describe '#attributes' do
    it 'has a name' do
      actual = event.name
      expected = "Carla's Craft Connection"
      expect(actual).to eq(expected)
    end
    it 'has  crafts' do
      actual = event.crafts
      expected = [craft]
      expect(actual).to eq(expected)
    end
    it 'has  attendees' do
      person.add_supply('fabric', 4)
      person.add_supply('scissors', 1)
      person.add_supply('fabric', 3)
      actual = event.attendees
      expected = [person]
      expect(actual).to eq(expected)
    end
    it '#attendee_names' do
      hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
      toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
      sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
      knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
      event = Event.new("Carla's Craft Connection", [sewing, knitting], [hector, toni])
      actual = event.attendee_names
      expected = ["Hector", "Toni"]
      expect(actual).to eq(expected)
    end

  end
  describe '#craft_with_most_supplies' do
    it 'tells you what crafts require most' do
      hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
      toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
      sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
      knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
      event = Event.new("Carla's Craft Connection", [sewing, knitting], [hector, toni])
      actual = event.craft_with_most_supplies
      expected =  "sewing"
      expect(actual).to eq(expected)
    end
  end
  describe '#supply_list' do
    it 'tells you what crafts require most' do
      hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
      toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
      sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
      knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
      event = Event.new("Carla's Craft Connection", [sewing, knitting], [hector, toni])
      actual = event.supply_list
      expected =  ["fabric", "scissors", "thread", "sewing_needles", "yarn", "knitting_needles"]
      expect(actual).to eq(expected)
    end
  end
end
