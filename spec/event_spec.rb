require './lib/event'

RSpec.describe Event do

  before(:each) do
    @hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    @toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
    @tony = Person.new({name: 'Tony', interests: ['drawing', 'knitting']})
    @sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
    @knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    @painting = Craft.new('painting', {canvas: 1, paint_brush: 2, paints: 5})
    @event = Event.new("Carla's Craft Connection", [@knitting, @painting, @sewing], [@hector, @toni, @tony])
  end

  describe '#initialize' do
    it 'has attributes' do
      expect(@event.name).to eq("Carla's Craft Connection")
      expect(@event.crafts).to eq([@knitting, @painting, @sewing])
      expect(@event.attendees).to eq([@hector, @toni, @tony])
    end
  end

  describe '#attendee_names' do
    it 'returns the names of people who participate in the event' do
      expect(@event.attendee_names).to eq(["Hector", "Toni", "Tony"])
    end
  end

  describe '#craft_with_most_supplies' do
    it 'returns the craft with the most supplies' do
      expect(@event.craft_with_most_supplies).to eq("sewing")
    end
  end

  describe '#supply_list' do
    it 'returns the list of needed supplies for all crafts as an array' do
      expect(@event.supply_list).to eq(["yarn", "scissors", "knitting_needles", "canvas", "paint_brush", "paints", "fabric", "thread", "sewing_needles"])
    end
  end

  describe '#attendees_by_craft_interest' do
    it 'returns a hash of people grouped by interests' do
      expected = {
        "knitting"=>[@toni, @tony],
        "painting"=>[],
        "sewing"=>[@hector, @toni]
      }
      expect(@event.attendees_by_craft_interest).to eq(expected)
    end
  end

end
