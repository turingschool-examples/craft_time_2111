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

    describe 'iteration 3' do
      let(:hector) {Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})}
      let(:toni) {Person.new({name: 'Toni', interests: ['sewing', 'knitting']})}
      let(:tony) {Person.new({name: 'Tony', interests: ['drawing', 'knitting']})}
      let(:knitting) {Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})}
      let(:sewing) {Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1})}
      let(:painting) {Craft.new('painting', {canvas: 1, paint_brush: 2, paints: 5})}
      let(:event) {Event.new("Carla's Craft Connection", [knitting, painting, sewing], [hector, toni, tony])}

      it '#attendees_by_craft_interest' do
        expected = {
          "knitting" => [toni, tony],
          "painting" => [],
          "sewing" => [hector, toni]
        }
        expect(event.attendees_by_craft_interest).to eq(expected)
      end

      it 'can sort crafts that use specific materials' do
        expect(event.crafts_that_use('scissors')).to eq([knitting, sewing])
        expect(event.crafts_that_use('fire')).to eq([])
      end
    end
  end
end
