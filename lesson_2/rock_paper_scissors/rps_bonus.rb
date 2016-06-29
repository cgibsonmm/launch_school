require 'yaml'
MESSAGES = YAML.load_file('messages.yml')

VALID_WIN_COMBOS = { 'rock' => %w(scissors lizard),
                     'paper' => %w(rock spock),
                     'scissors' => %w(paper lizard),
                     'lizard' => %w(paper spock),
                     'spock' => %w(rock scissors) }

VALID_CHOICES = { 'rock' => %w(1 rock ro r),
                  'paper' => %w(2 paper pa p),
                  'scissors' => %w(3 scissors sc),
                  'lizard' => %w(4 lizard li l),
                  'spock' => %w(5 spock sp) }

SCORE_TO_WIN = 5

def prompt(input)
  puts "~~ #{MESSAGES[input]} ~~"
end

def win?(first, second)
  VALID_WIN_COMBOS[first].include?(second)
end

def display_score(player_score, comp_score, games)
  puts "~~ The score is Player: #{player_score},
  Computer: #{comp_score} at game: #{games} ~~"
end

def display_game_history(hash)
  puts "-" * 20
  prompt('print_history')
  sleep(1)
  hash.each do |k, v|
    puts "---Game #{k + 1}---"
    puts " User choice: #{v[0]} | Computer choice: #{v[1]}"
    sleep(0.5)
  end
end

def display_final_winner(user, computer)
  if user >= SCORE_TO_WIN
    prompt('user_five')
    prompt('you_win')
  elsif computer >= SCORE_TO_WIN
    prompt('computer_5')
  end
end

def display_choices
  puts <<-MSG
  Please Choose:
  1) rock
  2) paper
  3) scissors
  4) lizard
  5) spock
  Enter number value or two letter abbreviation!
  MSG
end

def obtain_user_choice(input_from_user)
  VALID_CHOICES.each do |_, v|
    return VALID_CHOICES.key(v) if v.include?(input_from_user)
  end
end

# Replay loop
loop do
  prompt('game_welcome')
  sleep(0.5)
  prompt('champ')
  sleep(0.5)

  player_wins = 0
  computer_wins = 0
  games_played = 0
  user_choice = ''
  computer_choice = ''
  game_history = {}

  # Main game loop
  loop do
    # Set user choice for single game, tests if valid entry
    display_choices

    loop do
      user_choice = gets.chomp.downcase
      user_choice = obtain_user_choice(user_choice)

      if VALID_CHOICES.key?(user_choice)
        puts "~~ you have chosen: #{user_choice}! ~~"
        sleep(0.5)
        break
      else
        user_choice = ''
        prompt('invalid_entry')
        sleep(0.5)
      end
    end

    # Sets computer choice
    computer_choice = VALID_CHOICES.keys.sample
    prompt('rock_paper_scissors')
    sleep(0.5)
    puts "~~ The computer choose: #{computer_choice} ~~"
    sleep(0.5)

    # Prompts winner and adds to game score
    if win?(user_choice, computer_choice)
      prompt('you_win')
      player_wins += 1
    elsif win?(computer_choice, user_choice)
      prompt('computer_wins')
      computer_wins += 1
    else
      prompt('tie')
    end
    sleep(0.5)

    # Sets game history
    game_history[games_played] = [user_choice, computer_choice]
    games_played += 1
    display_final_winner(player_wins, computer_wins)

    break if player_wins == SCORE_TO_WIN || computer_wins == SCORE_TO_WIN

    display_score(player_wins, computer_wins, games_played)
    sleep(0.5)
  end

  display_game_history(game_history)
  sleep(0.5)

  prompt('play_again')
  final_answer = gets.chomp

  break unless final_answer.downcase.start_with?('y')
end
