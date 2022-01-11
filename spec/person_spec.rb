require './lib/person'
require './lib/craft'
require './lib/event'


RSpec.describe Person do
  subject { Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']}) }
  
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


end
