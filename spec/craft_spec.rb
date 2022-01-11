require './lib/craft'
require 'rspec'

RSpec.describe Craft do

  let(:craft) {Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})}

  context 'iteration I' do

    it 'exists and has attributes' do

      expect(craft.name).to eq("knitting")
      expect(craft.supplies_required).to eq({:yarn=>20, :scissors=>1, :knitting_needles=>2})
    end
  end
