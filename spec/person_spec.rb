require './lib/person'
require './lib/craft'
RSpec.describe Person do

  before(:each) do
    @person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    @sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
  end

  it 'is an instance of Person' do
    expect(@person).to be_instance_of(Person)
  end
end
