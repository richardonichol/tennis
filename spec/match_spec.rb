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

  it "shows correct score after two points" do
    @match.pointWonBy("player 1");
    @match.pointWonBy("player 2");
    expect(@match.score).to eq('0-0, 15-15')
  end

  it "shows correct score after four points" do
    @match.pointWonBy("player 1");
    @match.pointWonBy("player 2");
    @match.pointWonBy("player 1");
    @match.pointWonBy("player 1");
    expect(@match.score).to eq('0-0, 40-15')
  end

  it "shows correct score at deuce" do
    @match.pointWonBy("player 1");
    @match.pointWonBy("player 2");
    @match.pointWonBy("player 1");
    @match.pointWonBy("player 1");
    @match.pointWonBy("player 2");
    @match.pointWonBy("player 2");
    expect(@match.score).to eq('0-0, Deuce')
  end
end