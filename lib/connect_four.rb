# frozen_string_literal: true

# A class to model the game Connect Four
class Game
  attr_accessor :board

  def initialize(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
    @current_player = player_one
    @board = [[nil, nil, nil, nil, nil, nil, nil],
              [nil, nil, nil, nil, nil, nil, nil],
              [nil, nil, nil, nil, nil, nil, nil],
              [nil, nil, nil, nil, nil, nil, nil],
              [nil, nil, nil, nil, nil, nil, nil],
              [nil, nil, nil, nil, nil, nil, nil]]
    @winner = nil
    @winning_combinations_horizontal = [[0, 1, 2, 3],
                                        [1, 2, 3, 4],
                                        [2, 3, 4, 5],
                                        [3, 4, 5, 6]]

    @winning_combinations_vertical = [[0, 1, 2, 3],
                                      [1, 2, 3, 4],
                                      [2, 3, 4, 5]]

    @winning_combinations_diagonal_from_top_left = [[[2][0], [3][1], [4][2], [5][3]],
                                                    [[1][0], [2][1], [3][2], [4][3]],
                                                    [[2][1], [3][2], [4][3], [5][4]],
                                                    [[0][0], [1][1], [2][2], [3][3]],
                                                    [[1][1], [2][2], [3][3], [4][4]],
                                                    [[2][2], [3][3], [4][4], [5][5]],
                                                    [[0][1], [1][2], [2][3], [3][4]],
                                                    [[1][2], [2][3], [3][4], [4][5]],
                                                    [[2][3], [3][4], [4][5], [5][6]],
                                                    [[0][2], [1][3], [2][4], [3][5]],
                                                    [[1][3], [2][4], [3][5], [4][6]],
                                                    [[0][3], [1][4], [32][5], [3][6]]]

    @winning_combinations_diagonal_from_bottom_right = [[[5][3], [4][4], [3][5], [2][6]],
                                                        [[5][2], [4][3], [3][4], [2][5]],
                                                        [[4][3], [3][4], [2][5], [1][6]],
                                                        [[5][1], [4][2], [3][3], [2][4]],
                                                        [[4][2], [3][3], [2][4], [1][5]],
                                                        [[3][3], [2][4], [1][5], [0][6]],
                                                        [[5][0], [4][1], [3][2], [2][3]],
                                                        [[4][1], [3][2], [2][3], [1][4]],
                                                        [[3][2], [2][3], [1][4], [0][5]],
                                                        [[4][0], [3][1], [2][2], [1][3]],
                                                        [[3][1], [2][2], [1][3], [0][4]],
                                                        [[3][0], [2][1], [1][2], [0][3]]]
  end

  def wins_rows
    @board.each do |row|
      @winning_combinations_horizontal.each do |combo|
        mapped = []
        combo.each do |idx|
          mapped << row[idx]
        end
        return true if mapped.all?(mapped[0])
      end
    end
    false
  end

  def winner_exists
  end
end

x = Game.new('t', 'j')
p x.wins_rows
