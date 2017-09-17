class Match
  def initialize(p1, p2)
    @player1 = { name: p1, game_score: 0, set_score: 0 }
    @player2 = { name: p2, game_score: 0, set_score: 0 }
  end

  def pointWonBy(name)
    player(name)[:game_score] += 1 # would make this conditional on player(name) but input is assumed to be good
  end

  def player(name)
    { @player1[:name] => @player1, @player2[:name] => @player2 }[name]
  end

  def score
    "#{@player1[:set_score]}-#{@player2[:set_score]}, #{@player1[:game_score]}-#{@player2[:game_score]}"
  end

  def game_score
  end

  def set_score
  end
end