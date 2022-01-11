require './lib/person'
require './lib/craft'
require './lib/event'

RSpec.describe Event do
  let(:event) {Event.new("Carla's Craft Connection", [craft], [person])}
  let(:craft) {Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})}
  let(:person) {Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})}

  it 'has attributes' do
    expect(event.name).to eq("Carla's Craft Connection")
    expect(event.crafts).to eq([craft])
    expect(event.attendees).to eq([person])
  end

  describe 'iteration 2' do
    let(:hector) {Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})}
    let(:toni) {Person.new({name: 'Toni', interests: ['sewing', 'knitting']})}
    let(:sewing) {Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})}
    let(:knitting) {Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})}
    let(:event) {Event.new("Carla's Craft Connection", [sewing, knitting], [hector, toni])}

    it '#attendee_names' do
      expect(event.attendee_names).to eq(["Hector", "Toni"])
    end

    it '#craft_with_most_supplies' do
      expect(event.craft_with_most_supplies).to eq("sewing")
    end

    it '#supply_list' do
      expect(event.supply_list).to eq(["fabric", "scissors", "thread", "sewing_needles", "yarn", "knitting_needles"])
    end
  end
end
