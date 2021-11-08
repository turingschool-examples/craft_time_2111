require './lib/person'
require './lib/craft'
require './lib/event'

RSpec.describe Event do
  let!(:knitting){Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})}
  let!(:sewing){Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})}
  let!(:painting){Craft.new('painting', {canvas: 1, paint_brush: 2, paints: 5})}
  let!(:hector){Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})}
  let!(:toni){Person.new({name: 'Toni', interests: ['sewing', 'knitting']})}
  let!(:tony){Person.new({name: 'Tony', interests: ['drawing', 'knitting']})}
  let!(:event){Event.new("Carla's Craft Connection", [sewing, knitting], [hector, toni])}
  describe '#initialize' do
      it "exists" do
        expect(event).to be_a Event
      end

      it "has attributes" do
        expect(event.name).to eq "Carla's Craft Connection"
        expect(event.crafts).to eq [sewing, knitting]
        expect(event.attendees).to eq [hector, toni]
      end
  end

  describe '#craft_with_most_supplies' do
    it "finds the craft that needs the most unique items" do
      expect(event.craft_with_most_supplies).to eq(sewing)
    end
  end

  describe '#supply_list' do
    it "generates a list of all supply types needed" do
      expect(event.supply_list).to eq(["fabric", "scissors", "thread", "sewing_needles", "yarn", "knitting_needles"])
    end
  end

  describe '#can_build?' do
    xit "checks to see if a person can create a craft" do
      expect(hector.can_build?(sewing)).to be false
      hector.add_supply('fabric', 7)
      hector.add_supply('thread', 1)
      expect(hector.can_build?(sewing)).to be false
      hector.add_supply('scissors', 1)
      hector.add_supply('sewing_needles', 1)
      expect(hector.can_build?(sewing)).to be true
    end
  end

  describe '#attendees_by_craft_interest' do
    let(:event){Event.new("Carla's Craft Connection", [sewing, knitting, painting], [hector, toni, tony])}
    it "sorts attendees by their interests" do
      expected = {
        knitting => [toni, tony],
        painting => [],
        sewing => [hector, toni]
      }
    expect(event.attendees_by_craft_interest).to eq expected
    end
  end

  describe '#crafts_that_use' do
    it "finds what crafts use for a specific item" do
      expect(event.crafts_that_use('scissors')).to eq [knitting, sewing]
      expect(event.crafts_that_use('fire')).to eq []
    end

  end
end
