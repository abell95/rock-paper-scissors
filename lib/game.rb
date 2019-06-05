class Game

  attr_reader :started

  WINNERS = {
    scissors: :paper,
    paper: :rock,
    rock: :scissors
  }

  def start
    @started = true
  end

  def started?
    self.started || false
  end

  # could be better but this isn't horrible I guess
  def winner(left, right)
    if (WINNERS.has_key?(left) && WINNERS[left] == right)
      left.to_s.capitalize
    elsif(WINNERS.has_key?(right))
      right.to_s.capitalize
    end
  end

  def loser(left, right)
    if (WINNERS.has_key?(left) && WINNERS[left] == right)
      right.to_s
    elsif(WINNERS.has_key?(right))
      left.to_s
    end
  end

  def puts_winner(left, right) 
    "#{winner(left, right)} beats #{loser(left, right)}!"
  end

  def play(left = nil, right = nil)
    raise 'Game must first be started' unless started?
    return nil unless (left && right)
    if (left == right)
      "Tie game. Try again!"
    else
      puts_winner(left, right)
    end
  end

end