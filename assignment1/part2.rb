# Rock-Paper-Scissors

class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2
  rsp = 'RSP'
  game.map {|p,s| [p,s.upcase]}.sort do |a,b|
    i1, i2 = rsp.index(a[1]), rsp.index(b[1])
    raise NoSuchStrategyError if i1==nil or i2==nil
    if i1 == i2; 0
    elsif i1.succ % 3 == i2; -1
    else 1
    end
  end[0]
end

def tournament?(t)
  t.length == 2 and t[0].class == Array and t[0][0].class == Array
end

def rps_tournament_winner(tournament)
  if tournament? tournament
    rps_game_winner tournament.map {|x| rps_tournament_winner x}
  else
    rps_game_winner tournament
  end
end

