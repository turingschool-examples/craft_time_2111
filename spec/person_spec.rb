require './lib/person'

RSpec.describe Person do
  before :each do
    @person = Person.new({
      name: 'Hector',
      interests: ['sewing', 'millinery', 'drawing']
      })
  end

  it "exists" do
    expect(@person).to be_a(Person)
  end

  it "checks the atributes " do
    expect(@person.name).to eq('Hector')
    expect(@person.interests).to eq(['sewing', 'millinery', 'drawing'])
    expect(@person.suplies).to eq({})
  end
end
