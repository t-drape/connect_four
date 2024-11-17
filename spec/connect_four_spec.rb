# frozen_string_literal: true

require_relative './../lib/connect_four'

describe Game do # rubocop:disable Metrics/BlockLength
  describe '#win_rows' do
    context 'when a round is over, checks if player won on a row' do
      subject(:winner_row) { described_class.new('t', 'j') }

      it 'returns false with no row filled' do
        expect(winner_row.win_rows).to eql(false)
      end

      it 'returns true when one row is filled' do
        winner_row.board[0] = winner_row.board[0][0..3].map { 'x' }
        expect(winner_row.win_rows).to eql(true)
      end
    end
  end

  describe '#win_verticals' do
    context 'when a round is over, check if player won on a vertical' do
      subject(:winner_vertical) { described_class.new('t', 'j') }

      before do
        winner_vertical.board[0] = winner_vertical.board[0][0..3].map { 'x' }
      end

      it 'returns false with not vertical win' do
        expect(winner_vertical.win_verticals).to eql(false)
      end

      it 'returns true with vertical win' do
        winner_vertical.board[0][0] = 'x'
        winner_vertical.board[1][0] = 'x'
        winner_vertical.board[2][0] = 'x'
        winner_vertical.board[3][0] = 'x'

        expect(winner_vertical.win_verticals).to eql(true)
      end
    end
  end

  describe '#win_diagonal' do
    context 'when a round is over, checks if player won a diagonal' do
      subject(:diagonal) { described_class.new('t', 'j') }

      it 'returns false if no diagonal win' do
        expect(diagonal.win_diagonal).to eql(false)
      end

      it 'returns true if diagonal win on board from bottom right' do
        diagonal.board[5][3] = 'x'
        diagonal.board[4][4] = 'x'
        diagonal.board[3][5] = 'x'
        diagonal.board[2][6] = 'x'

        expect(diagonal.win_diagonal).to eql(true)
      end

      it 'returns true if diagonal win on board from top left' do
        diagonal.board[2][0] = 'x'
        diagonal.board[3][1] = 'x'
        diagonal.board[4][2] = 'x'
        diagonal.board[5][3] = 'x'

        expect(diagonal.win_diagonal).to eql(true)
      end
    end
  end

  describe '#win_exists' do
    context 'when a game is over, checks whole board for a win' do
      subject(:winner) { described_class.new('t', 'j') }

      it 'returns false if no win is present' do
        allow(winner).to receive(:win_rows).and_return(false)
        allow(winner).to receive(:win_verticals).and_return(false)
        allow(winner).to receive(:win_diagonal).and_return(false)
        expect(winner.win_exists).to eql(false)
      end

      it 'returns true if vertical win is present' do
        allow(winner).to receive(:win_verticals).and_return(true)
        expect(winner.win_exists).to eql(true)
      end

      it 'returns true if row win is present' do
        allow(winner).to receive(:win_rows).and_return(true)
        expect(winner.win_exists).to eql(true)
      end

      it 'returns true if diagonal win is present' do
        allow(winner).to receive(:win_diagonal).and_return(true)
        expect(winner.win_exists).to eql(true)
      end
    end
  end
end
