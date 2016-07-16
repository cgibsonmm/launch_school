require 'pry'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # Rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # Cols
                [[1, 5, 9], [3, 5, 7]] # Diagonals

INITIAL_MARKER = " ".freeze
PLAYER_MARKER = "X".freeze
COMPUTER_MARKER = "O".freeze
GAMES_TO_WIN = 5
FIRST_PLAYER = "Choice".freeze

def prompt(message)
  puts "--> #{message}"
end

# rubocop:disable Metrics/MethodLength, Metrics/AbcSize
def display_board(brd)
  system "clear"
  puts "TIC-TAC-TOE".rjust(14)
  puts "Player is #{PLAYER_MARKER}, Computer is #{COMPUTER_MARKER}"
  puts ""
  puts "     |     | "
  puts "  #{brd[1]}  |  #{brd[2]}  |   #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     | "
  puts "  #{brd[4]}  |  #{brd[5]}  |   #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |   #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/MethodLength, Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(arr, delimiter=', ', word='or')
  arr[-1] = "#{word} #{arr.last}" if arr.size > 1
  arr.size == 2 ? arr.join(' ') : arr.join(delimiter)
end

def player_place_piece!(brd)
  square = ''
  loop do
    prompt "Pick a square #{joinor(empty_squares(brd))}:"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, invalid choice!"
  end
  brd[square] = PLAYER_MARKER
end

def detect_defence(line, brd, marker)
  if brd.values_at(*line).count(marker) == 2
    return brd.select { |k, v| line.include?(k) && v == INITIAL_MARKER }
              .keys.first
  end
  nil
end

def defence_offenese(player, brd)
  WINNING_LINES.each do |line|
    square = detect_defence(line, brd, player)
    break if square
  end
end

def computer_place_peice!(brd)
  square = nil

  # offenes first
  defence_offenese(COMPUTER_MARKER, brd)
  binding.pry

  defence_offenese(PLAYER_MARKER, brd)

  if brd[5] == INITIAL_MARKER
    square = 5
  end

  if !square
    square = empty_squares(brd).sample
  end

  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

score = { "Player" => 0, "Computer" => 0 }
loop do
  board = initialize_board
  display_board(board)

  loop do
    display_board(board)
    player_place_piece!(board)
    break if someone_won?(board) || board_full?(board)
    computer_place_peice!(board)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
    score[detect_winner(board)] += 1
    # rubocop:disable Metrics/LineLength
    prompt "The score is Player: #{score['Player']}, Computer: #{score['Computer']} "
    # rubocop:enable Metrics/LineLength
    sleep(1)
  else
    prompt "It's a tie!"
  end

  answer = ''
  if score.value?(GAMES_TO_WIN)
    prompt "The #{score.key(GAMES_TO_WIN)} has won #{GAMES_TO_WIN} games!"
    loop do
      prompt "Play again? (Y or N)"
      answer = gets.chomp.downcase

      break if answer.start_with?('y', 'n')
      prompt "Error not a valid answer"
    end
  end
  puts score
  break if answer.start_with?('n')
end
