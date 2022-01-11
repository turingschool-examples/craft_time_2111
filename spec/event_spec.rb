require './lib/person'
require './lib/craft'
require './lib/event'

RSpec.describe do
  #let(:person) {Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})}
  let(:craft) {Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})}
  let(:hector) {Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})}
  let(:toni) {Person.new({name: 'Toni', interests: ['sewing', 'knitting']})}
  let(:tony) {Person.new({name: 'Tony', interests: ['drawing', 'knitting']})}
  let(:sewing) {Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})}
  let(:knitting) {Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})}
  let(:painting) {Craft.new('painting', {canvas: 1, paint_brush: 2, paints: 5})}
  let(:event) {Event.new("Carla's Craft Connection", [knitting, painting, sewing], [hector, toni, tony])}

  it "exists" do
    expect(event).to be_a Event
  end

  it "initializes" do
    expect(event.name).to eq("Carla's Craft Connection")
    expect(event.crafts).to eq([knitting, painting, sewing])
    expect(event.attendees).to eq([hector, toni, tony])
  end

  it "can find the craft with the most supplies" do
    expect(event.craft_with_most_supplies).to eq("sewing")
  end

  it "can return a supply list" do
    expect(event.supply_list).to eq(["yarn", "scissors", "knitting_needles", "canvas", "paint_brush", "paints", "fabric", "thread", "sewing_needles"])
  end

  it "can group attendees by interest" do
    expected = {
      "knitting" => [toni, tony],
      "painting" => [],
      "sewing" => [hector, toni]
    }

    expect(event.attendees_by_craft_interest).to eq(expected)
  end

  it "can sort by cafts that use" do
    event.crafts_that_use('scissors').to eq([sewing, knitting])
  end
end
