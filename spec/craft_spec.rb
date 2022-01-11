require './lib/person'
require './lib/craft'
require './lib/event'

RSpec.describe Craft do
  subject { Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2}) }
  #let(:activity_1) { Activity.new("Brunch") }
  it "exists" do
    expect(subject).to be_a Craft
    expect(subject.name).to eq('knitting')
    expect(subject.supplies_required).to eq({:yarn=>20, :scissors=>1, :knitting_needles=>2})
  end
end
