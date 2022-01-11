require './lib/person'
require './lib/craft'
require './lib/event'


RSpec.describe Person do
  subject { Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']}) }
  let(:sewing) { Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1}) }

  it "exists" do
    expect(subject).to be_a Person
    expect(subject.name).to eq('Hector')
    expect(subject.interests).to eq(["sewing", "millinery", "drawing"])
    expect(subject.supplies).to eq({})
  end

  it "can add supplies" do
    subject.add_supply('fabric', 4)
    subject.add_supply('scissors', 1)
    expect(subject.supplies).to eq({"fabric"=>4, "scissors"=>1})
    subject.add_supply('fabric', 3)
    expect(subject.supplies).to eq({"fabric"=>7, "scissors"=>1})
  end

  it "shows if person #can_build?" do

    expect(subject.can_build?(sewing)).to be false

    subject.add_supply('fabric', 7)
    subject.add_supply('thread', 1)
    expect(subject.can_build?(sewing)).to be false

    subject.add_supply('scissors', 1)
    subject.add_supply('sewing_needles', 1)
  
    expect(subject.can_build?(sewing)).to be true
  end
end
