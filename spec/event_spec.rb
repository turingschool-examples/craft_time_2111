require './spec_helper'

describe Event do
before :each do
  @person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
  @craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
  @event = Event.new("Carla's Craft Connection", [@craft], [@person])

end

  it 'exists and has attributes' do
    expect(@event).to be_a(Event)
    expect(@event.name).to eq("Carla's Craft Connection")
    expect(@event.crafts).to eq([@craft])
    expect(@event.attendees).to eq([@person])
  end

end

describe Event do
before :each do
  @hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
  @toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
  @sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
  @knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
  @event = Event.new("Carla's Craft Connection", [@sewing, @knitting], [@hector, @toni])
end

  it 'names attendees' do
    expect(@event.attendee_names).to eq(["Hector", "Toni"])
  end

  it 'names crafts with most supplies' do
    expect(@event.craft_with_most_supplies).to eq("sewing")
  end


  it 'makes a supply list' do
    expect(@event.supply_list).to eq(["fabric", "scissors", "thread", "sewing_needles", "yarn", "knitting_needles"])
  end

  it 'returns boolean based on supplies needed to build' do
    expect(@hector.can_build?(@sewing)).to eq(false)
  end

  it 'returns boolean based on supplies needed to build' do
    @hector.add_supply('fabric', 7)
    @hector.add_supply('thread', 1)
    expect(@hector.can_build?(@sewing)).to eq(false)
    @hector.add_supply('scissors', 1)
    @hector.add_supply('sewing_needles', 1)
    
  expect(@hector.can_build?(@sewing)).to eq(true)
  end



end


describe Event do
before :each do
  hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
  toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
  tony = Person.new({name: 'Tony', interests: ['drawing', 'knitting']})
  knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
  sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
  painting = Craft.new('painting', {canvas: 1, paint_brush: 2, paints: 5})
  event = Event.new("Carla's Craft Connection", [ knitting, sewing, painting], [hector, toni, tony])
end

 xit ' can list attendees by craft of interest' do
   expected = {
     "knitting" => [toni, tony],
     "painting" => [],
     "sewing" => [hector, toni]
   }
   expect(event.attendees_by_craft_interest).to eq(expected)
 end

 xit 'lists crafts that use an item as an argument' do
   expect(event.crafts_that_use('scissors')).to eq([knitting, sewing])
   expect(event.crafts_that_use('fire')).to eq([])
 end

end
