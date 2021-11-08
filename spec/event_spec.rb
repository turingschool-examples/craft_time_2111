require 'rspec'
require './lib/person'
require './lib/craft'
require './lib/event'

describe Event do 
  let(:event) {Event.new("Carla's Craft Connection", [craft], [person])}
  let(:craft) {Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})}
  let(:person) {Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})}

  it 'exists' do
    expect(event).to be_an_instance_of(Event)
  end

  it 'attributes' do
    expect(event.name).to eq("Carla's Craft Connection")
    expect(event.crafts).to eq([craft])
    expect(event.attendees).to eq([person])
  end
end

describe 'iteration 2' do 
  let(:event) {Event.new("Carla's Craft Connection", [sewing, knitting], [hector, toni])}
  let(:hector) {Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})}
  let(:toni) {Person.new({name: 'Toni', interests: ['sewing', 'knitting']})}
  let(:sewing) {Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})}
  let(:knitting) {Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})}

  it '#attendee names' do 
    expect(event.attendee_names).to eq(["Hector", "Toni"])
  end

  it '#craft_with_most_supplies' do 
    expect(event.craft_with_most_supplies).to eq("sewing")
  end

  it '#supplies as symbols list' do 
    expect(event.supply_symbols_list).to eq([:fabric, :scissors, :thread, :sewing_needles, :yarn, :scissors, :knitting_needles])
  end

  it '#supply list' do 
    expect(event.supply_list).to eq(["fabric", "scissors", "thread", "sewing_needles", "yarn", "knitting_needles"])
  end
end

describe 'iteration 3' do 
  let(:event) {Event.new("Carla's Craft Connection", [knitting, painting, sewing], [hector, toni, tony])}
  let(:hector) {Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})}
  let(:toni) {Person.new({name: 'Toni', interests: ['sewing', 'knitting']})}
  let(:tony) {Person.new({name: 'Tony', interests: ['drawing', 'knitting']})}
  let(:sewing) {Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1})}
  let(:painting) {Craft.new('painting', {canvas: 1, paint_brush: 2, paints: 5})}
  let(:knitting) {Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})}

  it '#attendees_by_craft_interest' do 
    expect(event.attendees_by_craft_interest).to eq({
    "knitting"=>[toni, tony],
    "painting"=>[],
    "sewing"=>[hector, toni]   
    })
  end

  it '#crafts that use' do 
  expect(event.crafts_that_use('scissors')).to eq([knitting, sewing])
  expect(event.crafts_that_use('fire')).to eq([])
  end
end

describe 'iteration 4' do
  let(:event) {Event.new("Carla's Craft Connection", [knitting, painting, sewing], [hector, toni, tony])}
  let(:hector) {Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing', 'painting']})}
  let(:toni) {Person.new({name: 'Toni', interests: ['sewing', 'knitting']})}
  let(:tony) {Person.new({name: 'Tony', interests: ['drawing', 'knitting', 'painting']})}
  let(:sewing) {Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1})}
  let(:painting) {Craft.new('painting', {canvas: 1, paint_brush: 2, paints: 5})}
  let(:knitting) {Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})}

  xit '#assign attendees to crafts' do 
    toni.add_supply('yarn', 30)
    toni.add_supply('scissors', 2)
    toni.add_supply('knitting_needles', 5)
    toni.add_supply('fabric', 10)
    toni.add_supply('scissors', 1)
    toni.add_supply('thread', 2)
    toni.add_supply('paint_brush', 10)
    toni.add_supply('paints', 20)
    tony.add_supply('yarn', 20)
    tony.add_supply('scissors', 2)
    tony.add_supply('knitting_needles', 2)
    hector.add_supply('fabric', 5)
    hector.add_supply('scissors', 1)
    hector.add_supply('thread', 1)
    hector.add_supply('canvas', 5)
    hector.add_supply('paint_brush', 10)
    hector.add_supply('paints', 20)

    expect(event.assign_attendees_to_crafts).to eq({knitting => [tony],
     painting => [hector],
     sewing => [toni]})
  end
end