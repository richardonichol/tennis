class Match
  def initialize(p1, p2)
    @player1 = { name: p1, game_score: 0, set_score: 0 }
    @player2 = { name: p2, game_score: 0, set_score: 0 }
  end

  def pointWonBy(name)
    player[name][:game_score] += 1 # would make this conditional on player[name] but input is assumed to be good
  end

  def player
    { @player1[:name] => @player1, @player2[:name] => @player2 }
  end

  def score
    "#{@player1[:set_score]}-#{@player2[:set_score]}, #{game_score}"
  end

  def score_to_s
    { 0 => '0', 1 => '15', 2 => '30', 3 => '40' }
  end

  def game_score
    if @player1[:game_score] > 2 && @player2[:game_score] > 2
      if @player1[:game_score] == @player2[:game_score]
        'Deuce'
      else
        @player1[:game_score] > @player2[:game_score] ? "Advantage #{@player1[:name]}" : "Advantage #{@player2[:name]}"
      end
    else
      "#{score_to_s[@player1[:game_score]]}-#{score_to_s[@player2[:game_score]]}"
    end
  end

  def set_score
  end
end