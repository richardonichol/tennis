require File.dirname(__FILE__) + "/../match"

describe Match do
  before do
    @match = Match.new('player 1', 'player 2')
  end

  it "shows start score correctly" do
    expect(@match.score).to eq('0-0, 0-0')
  end

  it "shows correct score after one point" do
    @match.pointWonBy("player 1");
    expect(@match.score).to eq('0-0, 15-0')
  end
end