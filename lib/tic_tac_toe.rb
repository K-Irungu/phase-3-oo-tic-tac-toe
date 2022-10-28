class TicTacToe
    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [6,4,2]
    ]
    def initialize
        board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
        @board = board
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(user_input)
        user_input.to_i - 1
    end

    def move(index, token = "X")
        @board[index] = token
    end

    def position_taken?(index)
        @board[index] == "X" || @board[index] == "O" ? true : false
    end

    def valid_move?(position)
        if position_taken?(position) == false && position.between?(0, 8) == true
            return true
        else 
            return false
        end
    end

    def turn_count
        @board.filter {|each| each == "X" || each == "O"}.length
    end

    def current_player
        turn_count % 2 == 0 ? "X" : "O"    
    end

    def turn
        puts "Please enter 1-9:"
        number = gets
        index = input_to_index(number)
        if valid_move?(index) == true
            move(index, current_player)
            display_board
        elsif valid_move?(index) == false
            self.turn
        end
    end

    def won?
        winning_indices = WIN_COMBINATIONS.filter do |winning_combo|
            (@board[winning_combo[0]] == "X" && @board[winning_combo[1]] == "X" && @board[winning_combo[2]] == "X") || (@board[winning_combo[0]] == "O" && @board[winning_combo[1]] == "O" && @board[winning_combo[2]] == "O")
        end
        winning_indices == [] ? false : winning_indices.flatten
    end

    def full?
        !@board.include?(' ')
    end

    def draw?
      self.full? && !self.won?
    end

    def over?
        self.won? || self.draw?
    end

    def winner
        if self.won? 
            (self.current_player == "X") ? "O" : "X"
        end
    end


    def play
        until self.over? 
            self.turn
        end
        if self.won? 
            puts "Congratulations #{self.winner}!"
        elsif self.draw?
            puts "Cat's Game!"
        end
    end
    
end