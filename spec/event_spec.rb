require './lib/person'
require './lib/craft'
require './lib/event'

RSpec.describe "Event" do
  before(:each) do
    @hector = Person.new({name: 'Hector',
                         interests: ['sewing', 'millinery', 'drawing']})
    @toni = Person.new({name: 'Toni',
                        interests: ['sewing', 'knitting']})

    @knitting = Craft.new('knitting', {yarn: 20,
                                       scissors: 1,
                                       knitting_needles: 2})
    @sewing = Craft.new('sewing', {fabric: 5,
                                   scissors: 1,
                                   thread: 1,
                                   sewing_needles: 1})
    @event = Event.new("Carla's Craft Connection", [@knitting, @sewing], [@hector, @toni])
  end

  it "exists" do
    expect(@event).to be_a Event
  end

  it "has attributes" do
    expect(@event.name).to eq("Carla's Craft Connection")
    expect(@event.crafts).to eq([@knitting, @sewing])
    expect(@event.attendees).to eq([@hector, @toni])
  end

  it "can list attendee names as an array of strings" do
    expect(@event.attendee_names).to eq(["Hector", "Toni"])
  end

  it "can show the craft that requires most supply types" do
    expect(@event.craft_with_most_supplies).to eq("sewing")
  end

  it "it can show a list of all supplies needed" do
    expect(@event.supply_list).to eq(["yarn", "scissors", "knitting_needles", "fabric", "thread", "sewing_needles"])
  end
end
