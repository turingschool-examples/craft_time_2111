require './lib/person'
require './lib/craft'
require './lib/event'

RSpec.describe do
  let(:person) {Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})}
  let(:craft) {Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})}
  let(:hector) {Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})}
  let(:toni) {Person.new({name: 'Toni', interests: ['sewing', 'knitting']})}
  let(:sewing) {Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})}
  let(:knitting) {Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})}
  let(:event) {Event.new("Carla's Craft Connection", [sewing, knitting], [hector, toni])}

  it "exists" do
    expect(event).to be_a Event
  end

  it "initializes" do
    expect(event.name).to eq("Carla's Craft Connection")
    expect(event.crafts).to eq([sewing, knitting])
    expect(event.attendees).to eq([hector, toni])
  end

  it "can find the craft with the most supplies" do
    expect(event.craft_with_most_supplies).to eq("sewing")
  end

  it "can return a supply list" do
    expect(event.supply_list).to eq(["fabric", "scissors", "thread", "sewing_needles", "yarn", "knitting_needles"])
  end
end
