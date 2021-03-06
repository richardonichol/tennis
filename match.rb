class Match
  def initialize(p1, p2)
    @player1 = { name: p1, game_score: 0, set_score: 0 }
    @player2 = { name: p2, game_score: 0, set_score: 0 }
  end

  def pointWonBy(name)
    player[name][:game_score] += 1
    if game_leader_won_game?
      game_leader[:set_score] += 1
      @player1[:game_score], @player2[:game_score] = 0, 0
    end
  end

  def game_leader_won_game?
    if tie_break?
      game_leader[:game_score] > 6 && game_leader[:game_score] > game_trailer[:game_score] + 1
    else
      game_leader[:game_score] > 3 && game_leader[:game_score] > game_trailer[:game_score] + 1
    end
  end

  def tie_break?
    @player1[:set_score] == 6 && @player2[:set_score] == 6
  end

  def game_leader
    @player1[:game_score] > @player2[:game_score] ? @player1 : @player2
  end

  def game_trailer
    @player1 == game_leader ? @player2 : @player1
  end

  def player
    { @player1[:name] => @player1, @player2[:name] => @player2 }
  end

  def score
    [set_score, game_score].compact.join(', ')
  end

  def score_to_s
    { 0 => '0', 1 => '15', 2 => '30', 3 => '40' }
  end

  def game_score
    tie_break? ? tie_break_score : regular_game_score
  end

  def regular_game_score
    if @player1[:game_score] > 2 && @player2[:game_score] > 2
      if @player1[:game_score] == @player2[:game_score]
        'Deuce'
      else
        @player1[:game_score] > @player2[:game_score] ? "Advantage #{@player1[:name]}" : "Advantage #{@player2[:name]}"
      end
    else
      "#{score_to_s[@player1[:game_score]]}-#{score_to_s[@player2[:game_score]]}" if @player1[:game_score] > 0 || @player2[:game_score] > 0
    end
  end

  def tie_break_score
    "#{@player1[:game_score]}-#{@player2[:game_score]}" if @player1[:game_score] > 0 || @player2[:game_score] > 0
  end

  def set_score
    "#{@player1[:set_score]}-#{@player2[:set_score]}"
  end
end