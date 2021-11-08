require './lib/event'

describe Event do
  before(:each) do
    @person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    @craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    @event = Event.new("Carla's Craft Connection", [@craft], [@person])
  end
  describe 'initialize' do
    it 'exists' do
      expect(@event).to be_a(Event)
    end
    it 'has attributes' do
      expect(@event.name).to eq("Carla's Craft Connection")
      expect(@event.crafts).to eq([@craft])
      expect(@event.attendees).to eq([@person])
    end
  end

  describe 'methods' do
    before(:each) do
      @hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
      @toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
      @tony = Person.new({name: 'Tony', interests: ['drawing', 'knitting']})
      @sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
      @knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
      @painting = Craft.new('painting', {canvas: 1, paint_brush: 2, paints: 5})
      @event = Event.new("Carla's Craft Connection", [@sewing, @knitting], [@hector, @toni])
      @event2 = Event.new("Carla's Craft Connection", [@knitting, @painting, @sewing], [@hector, @toni, @tony])

    end
    describe ' #attendee_names' do
      it 'returns an array of attendee names' do
        expect(@event.attendee_names).to eq(["Hector", "Toni"])
      end
    end

    describe ' #craft_with_most_supplies' do
      it 'returns a String' do
        expect(@event.craft_with_most_supplies).to be_a(String)
      end
      it 'returns the correct craft name' do
        expect(@event.craft_with_most_supplies).to eq("sewing")
      end
    end

    describe ' #supply_list' do
      it 'returns an array' do
        expect(@event.supply_list).to be_a(Array)
      end
      it 'returns an array of strings' do
        expect(@event.supply_list.all?{|name| name.class == String}).to eq(true)
      end
      it 'returns correct supply list' do
        expected = ["fabric", "scissors", "thread", "sewing_needles", "yarn", "knitting_needles"]
        expect(@event.supply_list).to eq(expected)
      end
    end

    describe ' #attendees_by_craft_interest' do
      it 'returns a hash' do
        expect(@event2.attendees_by_craft_interest).to be_a(Hash)
      end
      it 'returns arrays as values' do
        expect(@event2.attendees_by_craft_interest.values.all?{|item|item.class == Array}).to eq(true)
      end
      it 'returns correct hash' do
        expected = {
          "knitting"=>[@toni, @tony],
          "painting"=>[],
          "sewing"=>[@hector, @toni]
          }
        expect(@event2.attendees_by_craft_interest).to eq(expected)
      end
    end

    describe ' #crafts_that_use' do
      it 'returns an array' do
        expect(@event2.crafts_that_use('fire')).to be_a(Array)
      end
      it 'returns an empty array if supply is not used' do
        expect(@event2.crafts_that_use('fire')).to eq([])
      end
      it 'returns an array of the correct crafts' do
        expected = [@knitting, @sewing]
        expect(@event2.crafts_that_use('scissors')).to eq(expected)
      end
    end
  end
  describe ' #assign_attendees_to_crafts' do
    before(:each) do
      @hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing', 'painting']})
      @toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
      @tony = Person.new({name: 'Tony', interests: ['drawing', 'knitting', 'painting']})
      @knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
      @sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1})
      @painting = Craft.new('painting', {canvas: 1, paint_brush: 2, paints: 5})
      @toni.add_supply('yarn', 30)
      @toni.add_supply('scissors', 2)
      @toni.add_supply('knitting_needles', 5)
      @toni.add_supply('fabric', 10)
      @toni.add_supply('scissors', 1)
      @toni.add_supply('thread', 2)
      @toni.add_supply('paint_brush', 10)
      @toni.add_supply('paints', 20)
      @tony.add_supply('yarn', 20)
      @tony.add_supply('scissors', 2)
      @tony.add_supply('knitting_needles', 2)
      @hector.add_supply('fabric', 5)
      @hector.add_supply('scissors', 1)
      @hector.add_supply('thread', 1)
      @hector.add_supply('canvas', 5)
      @hector.add_supply('paint_brush', 10)
      @hector.add_supply('paints', 20)
      @event = Event.new("Carla's Craft Connection", [@knitting, @painting, @sewing], [@hector, @toni, @tony])
    end
    it 'returns a Hash' do
      expect(@event.assign_attendees_to_crafts).to be_a(Hash)
    end
    it 'has crafts as keys' do
      expect(@event.assign_attendees_to_crafts.keys.all?{|key|key.class == Craft}).to eq(true)
    end
  end
end
