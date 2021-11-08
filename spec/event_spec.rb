require './lib/person'
require './lib/craft'
require './lib/event'

RSpec.describe Event do
  describe '#initialize' do
    let(:person) { Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']}) }
    let(:craft) { Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2}) }
    let(:event) { Event.new("Carla's Craft Connection", [craft], [person])}
    it 'exists' do
      expect(event).to be_a(Event)
    end
    
    it 'has array of craft objects' do
      expect(event.crafts).to eq([craft])
    end
    
    it 'has array of attendees (persons)' do
      expect(event.attendees).to eq([person])
    end
  end
  
  describe 'iteration2' do
    let(:hector) { Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']}) }
    let(:toni) { Person.new({name: 'Toni', interests: ['sewing', 'knitting']}) }
    let(:sewing) { Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1}) }
    let(:knitting) { Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2}) }
    let(:event) { Event.new("Carla's Craft Connection", [sewing, knitting], [hector, toni])}
    
    describe '#attendee_names' do
      it 'can return array of person names' do
        expect(event.attendee_names).to eq(['Hector', 'Toni'])
      end
    end
    
    describe '#craft_with_most_supplies' do
      it 'can return the craft with the most supplies' do
        expect(event.craft_with_most_supplies).to eq('sewing')
      end
    end
    
    describe '#supply_list' do
      it 'can return an array of all required supplies at event' do
        expected = ['fabric', 'scissors', 'thread', 'sewing_needles', 'yarn', 'knitting_needles']
        expect(event.supply_list).to eq(expected)
      end
    end
  end
  
  describe 'iteration3' do
    let(:hector) { Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']}) }
    let(:toni) { Person.new({name: 'Toni', interests: ['sewing', 'knitting']}) }
    let(:tony) { Person.new({name: 'Tony', interests: ['drawing', 'knitting']}) }

    let(:knitting) { Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2}) }
    let(:sewing) { Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1}) }
    let(:painting) { Craft.new('painting', {canvas: 1, paint_brush: 2, paints: 5}) }
    let(:event) { Event.new("Carla's Craft Connection", [knitting, painting, sewing], [hector, toni, tony])}
    
    describe '#attendees_by_craft_interest' do
      it 'can return hash with craft name keys, and interested persons array' do
        expected = {
                    "knitting"=> [toni, tony],
                    "painting"=> [],
                    "sewing"=> [hector, toni]
                    }
        expect(event.attendees_by_craft_interest).to eq(expected) 
      end
    end

    describe '#crafts_that_use' do
      it 'can return array of crafts that use a specific supply' do
        expected = [knitting, sewing]
        expect(event.crafts_that_use('scissors')).to eq(expected)
        expect(event.crafts_that_use('fire')).to eq([])
      end
    end
  end

  # describe 'iteration4' do
  #   let(:hector) { Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing', 'painting']}) }
  #   let(:toni) { Person.new({name: 'Toni', interests: ['sewing', 'knitting']}) }
  #   let(:tony) { Person.new({name: 'Tony', interests: ['drawing', 'knitting', 'painting']}) }

  #   let(:knitting) { Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2}) }
  #   let(:sewing) { Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1}) }
  #   let(:painting) { Craft.new('painting', {canvas: 1, paint_brush: 2, paints: 5}) }
  #   let(:event) { Event.new("Carla's Craft Connection", [knitting, painting, sewing], [hector, toni, tony])}

  #   # describe '#can_build_crafts_list' do

  #   # end
  #   describe '#assign_attendees_to_crafts' do
  #     xit 'can randomly assign attendees to crafts if interested and supplies' do
  #       toni.add_supply('yarn', 30)
  #       toni.add_supply('scissors', 2)
  #       toni.add_supply('knitting_needles', 5)
  #       toni.add_supply('fabric', 10)
  #       toni.add_supply('scissors', 1)
  #       toni.add_supply('thread', 2)
  #       toni.add_supply('paint_brush', 10)
  #       toni.add_supply('paints', 20)
  #       tony.add_supply('yarn', 20)
  #       tony.add_supply('scissors', 2)
  #       tony.add_supply('knitting_needles', 2)
  #       hector.add_supply('fabric', 5)
  #       hector.add_supply('scissors', 1)
  #       hector.add_supply('thread', 1)
  #       hector.add_supply('canvas', 5)
  #       hector.add_supply('paint_brush', 10)
  #       hector.add_supply('paints', 20)

  #       expected1 = {
  #                   knitting => [tony],
  #                   painting => [hector],
  #                   sewing   => [toni]
  #                  }

  #       expected2 = {
  #                   knitting => [tony],
  #                   painting => [],
  #                   sewing   => [hector, toni]
  #                  }

  #       expected3 = {
  #                   knitting => [toni, tony],
  #                   painting => [],
  #                   sewing   => [hector]
  #                  }

  #       expected4 = {
  #                   knitting => [toni, tony],
  #                   painting => [hector],
  #                   sewing   => []
  #                  }
     
  #       expect(event.assign_attendees_to_crafts).to eq(expected1).or eq(expected2).or eq(expected3).or eq(expected4)
  #     end
  #   end
  # end
end