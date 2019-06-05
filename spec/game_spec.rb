require_relative '../lib/game'

describe 'A game of rock paper scissors' do

  it 'exists' do
    Game.new
  end

  it 'can start' do
    Game.new.start
  end

  it 'is not initially started' do
    game = Game.new
    expect(game).to_not be_started
  end

  it 'a started game knows that it has started' do
    game = Game.new
    game.start
    expect(game).to be_started
  end

  describe 'playing' do

    # can use subject here too

    context 'without starting' do
      it 'can not be played if it has not started' do
        game = Game.new
        expect { game.play }.to raise_error(RuntimeError)
      end
    end

    context 'after starting' do
      it 'can be played if it has started' do
        game = Game.new
        game.start
        expect { game.play }.to_not raise_error
      end

      it 'returns nil when not provided with anything' do
        game = Game.new
        game.start
        expect(game.play).to be_nil
      end

      it 'returns nil when only provided one rock, paper or scissor' do
        game = Game.new
        game.start
        expect(game.play(:FAKE)).to be_nil
      end

      it 'does not return nil when two objects are provided' do
        game = Game.new
        game.start
        expect(game.play(:FAKE, :FAKE)).to_not be_nil
      end
    end

    context 'game results are correct' do
      # create subject.. don't remember how
      game = Game.new
      game.start

      it 'announces the correct winner for rock vs scissors' do
        expect(game.play(:rock, :scissors)).to eq("Rock beats scissors!")
        expect(game.play(:scissors, :rock)).to eq("Rock beats scissors!")
      end

      it 'announces the correct winner for rock vs paper' do
        expect(game.play(:rock, :paper)).to eq("Paper beats rock!")
        expect(game.play(:paper, :rock)).to eq("Paper beats rock!")
      end

      it 'announces the correct winner for scissors vs paper' do
        expect(game.play(:scissors, :paper)).to eq("Scissors beats paper!")
        expect(game.play(:paper, :scissors)).to eq("Scissors beats paper!")
      end

      it 'ties on the same move' do
        expect(game.play(:rock, :rock)).to eq("Tie game. Try again!")
        expect(game.play(:paper, :paper)).to eq("Tie game. Try again!")
        expect(game.play(:scissors, :scissors)).to eq("Tie game. Try again!")
      end
    end
  end
end
