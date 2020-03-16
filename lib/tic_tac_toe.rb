class TicTacToe
<<<<<<< HEAD

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
  ]

def initialize
  @board = Array.new(9, " ")
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

def move(index, current_player = "X")
  @board[index] = current_player
end

def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
end

def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end

def turn_count
  turn = 0
  @board.each do |index|
    if index == "X" || index == "O"
      turn += 1
    end
  end
  return turn
end

def current_player
  #if the turn count is an even number, that means O just went, so the next/current player is X
  num_turns = turn_count
  if num_turns % 2 == 0
    player = "X"
  else
    player = "O"
  end
  return player
end

def turn
    a = 0
    movev = ""
    puts "Please enter a position between 1 and 9:  "
    movev = gets.chomp
    while a == 0 do
     boardindex = input_to_index(movev)
     if valid_move?(boardindex) then 
      move(boardindex,current_player)
       display_board
       a = 1 
     else
       puts "Please enter a valid position between 1 and 9 that has not been taken:  "
       movev = gets.chomp
     end
    end
  end

def won?
  WIN_COMBINATIONS.each {|win_combo|
    index_0 = win_combo[0]
    index_1 = win_combo[1]
    index_2 = win_combo[2]

    position_1 = @board[index_0]
    position_2 = @board[index_1]
    position_3 = @board[index_2]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combo
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combo
    end
  }
  return false
end

def full?
  @board.all? {|index| index == "X" || index == "O"}
end

def draw?
  if !won? && full?
    return true
  else
    return false
  end
end

def over?
  if won? || draw?
    return true
  else
    return false
  end
end

def winner
  index = []
  index = won?
  if index == false
    return nil
  else
    if @board[index[0]] == "X"
      return "X"
    else
      return "O"
    end
  end
end

def play
  until over? == true
    turn
  end

  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end

end






=======
  
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
 
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
 
  def winning_player
    turn_count % 2 == 1 ? "X" : "O"
  end
  
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
 
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(playerinput)
    playerinput.to_i - 1
  end
  
    def position_taken?(move)
  @board[move] == "X" || @board[move] == "O" 
  end
  
  def valid_move?(move)
    ((0..8).include?(move) && !position_taken?(move))
  end
  
  def move(index,player)
    @board[index] = current_player
  end
  
  def turn
    puts "Please enter a number (1-9):"
    user_input = $stdin.gets.strip
    index = input_to_index(user_input)
    if valid_move?(index)
      token = current_player
      move(index, token)
    else
      turn
    end
    display_board
  end

  
  #def turn
   # a = 0
  #  movev = ""
   # puts "Please enter a position between 1 and 9:  "
  #  movev = gets.chomp
   # while a == 0 do
  #   boardindex = input_to_index(movev)
   #  if valid_move?(boardindex) then 
  #     @board[boardindex] = current_player
   #    display_board
  #     a = 1 
  #   else
   #    puts "Please enter a valid position between 1 and 9 that has not been taken:  "
     #  movev = gets.chomp
    # end
    #end
  #end
  
  def won?
    xarray = []
    oarray = []
    a = 0
    rett = FALSE
    @board.each do |board|
      if board == "X" then xarray << a 
      elsif board == "O" then oarray << a end
      a = a + 1 
    end
    WIN_COMBINATIONS.each do |array| 
      if (xarray & array) == array then rett = array end
      if (oarray & array) == array then rett = array end
    end 
    rett 
  end
  
  def full?
    a = 0
    @board.each do |b| 
      if b == " " then a = 1 end
    end
    a == 0
  end
  
  def draw?
    full? && !won?
  end
  
  def over?
    full? || (won? != FALSE)
  end
  
  def winner 
    if won? then winning_player end
  end
  
  def play 
    while !over? do turn end
    if won? then puts "#{winner} has won the game.  Congratulations!" end
    if draw? then puts "This game has ended in a draw" end
  end
  
end

#game = TicTacToe.new
#game.play 
#puts game.input_to_index("3")
>>>>>>> e5a36ae8585fd781b61c7843b3f857e761d089d7
