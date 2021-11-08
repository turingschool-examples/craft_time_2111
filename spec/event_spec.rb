require './lib/person'
require './lib/craft'
require './lib/event'

RSpec.describe Event do
  let!(:knitting){Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})}
  let!(:sewing){Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})}
  let!(:hector){Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})}
  let!(:toni){Person.new({name: 'Toni', interests: ['sewing', 'knitting']})}
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
end
