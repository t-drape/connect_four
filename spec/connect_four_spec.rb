# frozen_string_literal: true

require_relative './../lib/connect_four'

describe Game do
  describe '#winner_exists' do
    context 'when the board is checked for a winner' do
      subject(:winner) { described_class.new('t', 'j') }
      it 'returns false if board empty' do
        expected_output = false
        true_output = winner.winner_exists
        expect(true_ouput).to eql(expected_output)
      end
    end
  end
end

[[nil, nil, nil, nil, nil, nil, nil],
 [nil, nil, nil, nil, nil, nil, nil],
 [nil, nil, nil, nil, nil, nil, nil],
 [nil, nil, nil, nil, nil, nil, nil],
 [nil, nil, nil, nil, nil, nil, nil],
 [nil, nil, nil, nil, nil, nil, nil]]
