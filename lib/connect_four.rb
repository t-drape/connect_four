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

  def win_rows
    @board.each do |row|
      @winning_combinations_horizontal.each do |combo|
        mapped = []
        combo.each do |idx|
          mapped << row[idx]
        end
        return true if mapped.all?(mapped[0]) && !mapped[0].nil?
      end
    end
    false
  end

  def win_verticals
    7.times do |spot_index|
      win = []
      @winning_combinations_vertical.each do |combo|
        combo.each do |vertical_index|
          win << @board[vertical_index][spot_index]
        end
        return true if win.all?(win[0]) && !win[0].nil?
      end
    end
    false
  end

  def win_diagonal
    p @winning_combinations_diagonal_from_top_left
  end

  def winner_exists
  end
end
