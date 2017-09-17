require File.dirname(__FILE__) + "/../match"

describe Match do
  before do
    @match = Match.new('Foo', 'Bah')
  end

  it "shows start score correctly" do
    expect(match.score).to eq('0-0, 0-0')
  end
end