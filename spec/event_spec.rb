require './lib/person'
require './lib/craft'
require './lib/event'

RSpec.describe Event do
  it "exists" do
    person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    event = Event.new("Carla's Craft Connection", [craft], [person])
    expect(event).to be_a(Event)
  end

  it "attributes" do
    person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    event = Event.new("Carla's Craft Connection", [craft], [person])
    expect(event.name).to eq("Carla's Craft Connection")
    expect(event.crafts).to eq([craft])
    expect(event.attendees).to eq([person])
  end

  it "attendee names" do
    hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
    sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
    knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    event = Event.new("Carla's Craft Connection", [sewing, knitting], [hector, toni])
    expect(event.attendee_names).to eq(["Hector", "Toni"])
   end

   it "craft_with_most_supplies" do
     hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
     toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
     sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
     knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
     event = Event.new("Carla's Craft Connection", [sewing, knitting], [hector, toni])
     expect(event.craft_with_most_supplies).to eq("sewing")
   end

   it "supply list" do
     hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
     toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
     sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
     knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
     event = Event.new("Carla's Craft Connection", [sewing, knitting], [hector, toni])
     expect(event.supply_list).to eq(["fabric", "scissors", "thread", "sewing_needles", "yarn", "knitting_needles"])
   end

   it "attendees_by_craft_interest" do
    hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
    tony = Person.new({name: 'Tony', interests: ['drawing', 'knitting']})
    knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1})
    painting = Craft.new('painting', {canvas: 1, paint_brush: 2, paints: 5})
    event = Event.new("Carla's Craft Connection", [knitting, painting, sewing], [hector, toni, tony])
    expected = {
      "knitting"=>[toni, tony],
      "painting"=>[],
      "sewing"=>[hector, toni]
      }
    expect(event.attendees_by_craft_interest).to eq(expected)
   end

   it "crafts_that_use" do
     hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
     toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
     tony = Person.new({name: 'Tony', interests: ['drawing', 'knitting']})
     knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
     sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1})
     painting = Craft.new('painting', {canvas: 1, paint_brush: 2, paints: 5})
     event = Event.new("Carla's Craft Connection", [knitting, painting, sewing], [hector, toni, tony])
     expect(event.crafts_that_use('scissors')).to eq([knitting, sewing])
     expect(event.crafts_that_use('fire')).to eq([])
   end

   it "assign attendees to crafts" do
     hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing', 'painting']})
     toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
     tony = Person.new({name: 'Tony', interests: ['drawing', 'knitting', 'painting']})
     knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
     sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1})
     painting = Craft.new('painting', {canvas: 1, paint_brush: 2, paints: 5})
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
     event = Event.new("Carla's Craft Connection", [knitting, painting, sewing], [hector, toni, tony])
     expect(event.assign_attendees_to_crafts).to eq({})
   end


end


