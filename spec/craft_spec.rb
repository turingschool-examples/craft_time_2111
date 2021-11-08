require './lib/person'
require './lib/craft'
require './lib/event'

RSpec.describe Craft do
  context 'Iteration I' do
    let(:craft) {Craft.new('knitting', {
      yarn: 20,
      scissors: 1,
      knitting_needles: 2})}

    describe 'Craft' do
      it 'exists' do

        expect(craft).to be_a(Craft)
      end

      it 'has attributes' do

        expect(craft.name).to eq("knitting")
        expect(craft.supplies_required).to eq({
          yarn: 20,
          scissors: 1,
          knitting_needles: 2})
      end
    end
  end
end
