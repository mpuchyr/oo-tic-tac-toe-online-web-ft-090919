class TicTacToe

  attr_accessor :board
  
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
    @board = []
    9.times do
      @board << " "
    end
  end
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(user_input)
    index = user_input.to_i - 1
    index
  end
  
  def move(index, token = "X")
    @board[index] = token
    @board
  end
  
  def position_taken?(index)
    if @board[index] == " "
      false
    else
      true
    end
  end
  
  def valid_move?(index)
    (0..8).include?(index) && !position_taken?(index)
  end
  
  def turn_count
    occupied = @board.select {|space| space != " "}
    occupied.length
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  
  def turn
    move_is_valid = false
    
    while move_is_valid == false do
      token = current_player
      puts "Player #{token}, please enter a space 1-9:"
      user_choice = gets.chomp
      user_choice = input_to_index(user_choice)
      move_is_valid = valid_move?(user_choice)
      if move_is_valid
        move(user_choice, token)
        display_board
      end
    end
  end
    
  def won?
    winning_combo = nil
      
    WIN_COMBINATIONS.each do |combo|
      if @board.values_at(combo[0], combo[1], combo[2]) == ["X", "X", "X"]
        winning_combo = combo
      elsif @board.values_at(combo[0], combo[1], combo[2]) == ["O", "O", "O"]
        winning_combo = combo
      end
    end
      
    winning_combo
  end
    
  def full?
    spaces_taken = []
      
    @board.each do |space|
      if space == "X" || space == "O"
        spaces_taken << space
      end
    end
      
    if spaces_taken.length == 9
      true
    else
      false
    end
  end
    
  def draw?
    if won?
      false
    elsif full?
      true
    end
  end
    
  def over?
    won? || draw?
  end
    
  def winner
    winning_combo = won?
    if winning_combo
      @board[winning_combo[0]]
    else
      nil
    end
  end
  
  def play
    
    
    until over?
      turn
    end
    
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end

    
  end
    

  
end