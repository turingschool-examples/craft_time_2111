require './lib/person'

RSpec.describe Person do
  let!(:person){Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})}
  describe '#initialize' do
      it "exists" do
        expect(person).to be_a Person
      end

      it "has attributes" do
        expect(person.name).to eq "Hector"
        expect(person.intersts).to eq 'sewing', 'millinery', 'drawing']
      end
  end
end
