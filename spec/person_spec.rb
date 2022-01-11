require './lib/person'
require './lib/craft'
require './lib/event'

RSpec.describe Person do
  before(:each) do
    @person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
  end

  it 'exists' do
    expect(@person).to be_instance_of Person
  end
end
