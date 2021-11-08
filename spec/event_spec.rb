require './lib/person'
require './lib/craft'
require './lib/event'

RSpec.describe Event do
  context 'Iteration I' do
    let(:person) {Person.new({
      name: 'Hector',
      interests: ['sewing', 'millinery', 'drawing']})}
    let(:hector) {Person.new({
      name: 'Hector',
      interests: ['sewing', 'millinery', 'drawing']})}
    let(:toni) {Person.new({
      name: 'Toni',
      interests: ['sewing', 'knitting']})}

    let(:craft) {Craft.new('knitting', {
      yarn: 20,
      scissors: 1,
      knitting_needles: 2})}
    let(:sewing) {Craft.new('sewing', {
      fabric: 5,
      scissors: 1,
      thread: 1,
      sewing_needles: 1})}
    let(:knitting) {Craft.new('knitting', {
      yarn: 20,
      scissors: 1,
      knitting_needles: 2})}


    let(:event) {Event.new("Carla's Craft Connection", [craft], [person])}
    let(:event_2) {Event.new("Carla's Craft Connection", [sewing, knitting], [hector, toni])}


    describe 'Event' do
      it 'exists' do

        expect(event).to be_a(Event)
        expect(event_2).to be_a(Event)
      end

      it 'has attributes' do

        expect(event.name).to eq("Carla's Craft Connection")
        expect(event.crafts).to eq([craft])
        expect(event.attendees).to eq([person])

        expect(event_2.name).to eq("Carla's Craft Connection")
        expect(event_2.crafts).to eq([sewing, knitting])
        expect(event_2.attendees).to eq([hector, toni])
      end
    end

    describe 'Event_2' do
      it 'exists' do

        expect(event_2).to be_a(Event)
      end

      it 'has attributes' do

        expect(event_2.name).to eq("Carla's Craft Connection")
        expect(event_2.crafts).to eq([sewing, knitting])
        expect(event_2.attendees).to eq([hector, toni])
      end

      it 'can display attendee names' do

        expect(event_2.attendee_names).to eq(["Hector", "Toni"])
      end

      it 'can select the craft with the most supplies' do

        expect(event_2.craft_with_most_supplies).to eq("sewing")
      end
    end
  end
end
