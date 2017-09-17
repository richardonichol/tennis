require File.dirname(__FILE__) + "/../match"

describe Match do
  before do
    @match = Match.new('player 1', 'player 2')
  end

  it "shows start score correctly" do
    expect(@match.score).to eq('0-0')
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

  it "shows advantage correctly" do
    @match.pointWonBy("player 1");
    @match.pointWonBy("player 2");
    @match.pointWonBy("player 1");
    @match.pointWonBy("player 1");
    @match.pointWonBy("player 2");
    @match.pointWonBy("player 2");
    @match.pointWonBy("player 1");
    expect(@match.score).to eq('0-0, Advantage player 1')
  end

  it "shows correct score when a game is won" do
    @match.pointWonBy("player 1");
    @match.pointWonBy("player 2");
    @match.pointWonBy("player 1");
    @match.pointWonBy("player 1");
    @match.pointWonBy("player 2");
    @match.pointWonBy("player 2");
    @match.pointWonBy("player 1");
    @match.pointWonBy("player 1");
    expect(@match.score).to eq('1-0')
  end

  it "shows first tiebreak point correctly" do
    @match.player['player 1'][:set_score] = 6
    @match.player['player 2'][:set_score] = 6
    @match.pointWonBy("player 1");
    expect(@match.score).to eq('6-6, 1-0')
  end
end