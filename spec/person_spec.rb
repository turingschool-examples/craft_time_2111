require './spec_helper'

describe Person do
before :each do
  @person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})


end

  it 'exists and has attributes' do
    expect(@person).to be_a(Person)
    expect(@person.name).to eq('Hector')
    expect(@person.interests).to eq(['sewing', 'millinery', 'drawing'])
    expect(@person.supplies).to eq({})
  end

  it 'has supplies' do
    @person.add_supply('fabric', 4)
    @person.add_supply('scissors', 1)
    expected = {
      'fabric' => 4,
      'scissors' => 1
    }
    expect(@person.supplies).to eq(expected)
    @person.add_supply('fabric', 3)
    expected = {
      'fabric' => 7,
      'scissors' => 1
    }
    expect(@person.supplies).to eq(expected)

  end

end
