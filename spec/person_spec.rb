require './lib/person'
require './lib/craft'
require './lib/event'

RSpec.describe Person do
  let(:person) {Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})}

  it 'has attributes' do
    expect(person.name).to eq("Hector")
    expect(person.interests).to eq(["sewing", "millinery", "drawing"])
  end

  it 'does not have supplies by default' do
    expect(person.supplies).to eq({})
  end

  it '#add_supply' do
    person.add_supply('fabric', 4)
    person.add_supply('scissors', 1)
    expect(person.supplies).to eq({"fabric"=>4, "scissors"=>1})
    person.add_supply('fabric', 3)
    expect(person.supplies).to eq({"fabric"=>7, "scissors"=>1})
  end

  describe 'iteration 2' do
    let(:hector) {Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})}
    let(:toni) {Person.new({name: 'Toni', interests: ['sewing', 'knitting']})}
    let(:sewing) {Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})}
    let(:knitting) {Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})}
    let(:event) {Event.new("Carla's Craft Connection", [sewing, knitting], [hector, toni])}

    it 'cannot build without the proper supplies' do
      expect(hector.can_build?(sewing)).to eq(false)
      hector.add_supply('fabric', 7)
      hector.add_supply('thread', 1)
      expect(hector.can_build?(sewing)).to eq(false)
      hector.add_supply('scissors', 1)
      hector.add_supply('sewing_needles', 1)
      expect(hector.can_build?(sewing)).to eq(true)
    end

  end
end
