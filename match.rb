class Match
  def initialize(p1, p2)
    @player1 = { name: p1, game_score: 0, set_score: 0 }
    @player2 = { name: p1, game_score: 0, set_score: 0 }
  end

  def pointWonBy
  end

  def score
    raise "SCORE!"
  end

  def game_score
  end

  def set_score
  end
end