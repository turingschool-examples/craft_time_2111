require './lib/craft'

RSpec.describe 'Craft' do
  it 'exists' do
    knitting = Craft.new('knitting', { yarn: 20, scissors: 1, knitting_needles: 2 })
    expect(knitting).to be_an_instance_of(Craft)
  end

  it 'has a name' do
    knitting = Craft.new('knitting', { yarn: 20, scissors: 1, knitting_needles: 2 })
    expect(knitting.name).to eq('knitting')
  end

  it 'supplies required' do
    knitting = Craft.new('knitting', { yarn: 20, scissors: 1, knitting_needles: 2 })
    expect(knitting.supplies_required).to eq({ yarn: 20, scissors: 1, knitting_needles: 2 })
  end

  it 'exists' do
    sewing = Craft.new('sewing', { fabric: 5, scissors: 1, thread: 2, sewing_needles: 1 })
    expect(sewing).to be_an_instance_of(Craft)
  end
end
