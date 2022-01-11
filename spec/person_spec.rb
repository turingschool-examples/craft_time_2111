require './lib/person'
require './lib/event'
require './lib/craft'
require 'pry'

RSpec.describe Person do #Iteration 1
  before(:each) do
    @person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
  end

  it 'exists' do
    expect(@person).to be_instance_of Person
  end

  it 'has a name' do
    expect(@person.name).to eq "Hector"
  end

  it 'has interests' do
    expect(@person.interests).to eq ["sewing", "millinery", "drawing"]
  end

  it 'has supplies' do
    expected = {}
    expect(@person.supplies).to eq expected
  end

  it 'can add supplies' do
    @person.add_supply('fabric', 4)
    @person.add_supply('scissors', 1)

    expected = {"fabric"=>4, "scissors"=>1}
    expect(@person.supplies).to eq expected

    @person.add_supply('fabric', 3)

    expected = {"fabric"=>7, "scissors"=>1}
    expect(@person.supplies).to eq expected
  end
end
