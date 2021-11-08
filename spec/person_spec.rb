RSpec.describe Person do

  before(:each) do
    @person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
  end


  it 'is an instance of Person' do
    expect(@person).to be_instance_of(Person)
  end

  it 'can access name from inputted hash' do
    expect(@person.name).to eq("Hector")
  end

  it 'can access interests array' do
    expected_array = ["sewing", "millinery", "drawing"]
    expect(@person.interests).to eq(expected_array)
  end

  it 'can initialize empty supplies hash' do
    expect(@person.supplies).to eq({})
  end

end
