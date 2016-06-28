require 'yaml'
MESSAGES = YAML.load_file('messages.yml')

# SETS game vars
VALID_CHOICES = %w(rock paper scissors lizard spock)

VALID_WIN_COMBOS = { 'rock' => %w(scissors lizard),
                     'paper' => %w(rock spock),
                     'scissors' => %w(paper lizard),
                     'lizard' => %w(paper spock),
                     'spock' => %w(rock scissors) }

valid_entry_for_choice = { 'rock' => %w(1 rock ro r),
                           'paper' => %w(2 paper pa p),
                           'scissors' => %w(3 scissors sc),
                           'lizard' => %w(4 lizard li l),
                           'spock' => %w(5 spock sp) }

game_history = {}
player_wins = 0
computer_wins = 0
games_played = 0
user_choice = ''
computer_choice = ''

# Define game prompt
def prompt(input)
  puts "~~ #{MESSAGES[input]} ~~"
end

# Defines a game win
def win?(first, second)
  VALID_WIN_COMBOS[first].include?(second)
end

# Displays score
def display_score(wins, games)
  puts "~~ You have won #{wins} out of #{games} games played. ~~"
end

def display_game_history(hash)
  puts "-" * 20
  prompt('print_history')
  sleep(5)
  hash.each do |k, v|
    puts "---Game#{k}---"
    puts " User choice: #{v[0]} | Computer choice: #{v[1]}"
    sleep(0.5)
  end
end

def set_game_histroy(user, computer, games)
  game_history = {}
  game_history.merge!({ "#{games.to_i + 1}" => [user, computer] })
end

# Displayes final winner
def display_final_winner(user, computer)
  if user >= 5
    prompt('user_five')
    prompt('you_win')
  elsif computer >= 5
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

# Replay loop
loop do
  prompt('game_welcome')
  sleep(1)
  prompt('champ')
  sleep(1)
  # Main game loop
  loop do
    # Set user choice for single game, tests if valid entry
    display_choices
    loop do
      user_choice = gets.chomp.downcase

      # Sets user input to rock, paper, etc. from orignal input
      valid_entry_for_choice.each do |_, v|
        if v.include?(user_choice)
          user_choice = valid_entry_for_choice.key(v)
        end
      end

      # Test whether input is a valid choice and allows game to run if true
      if valid_entry_for_choice.key?(user_choice)
        puts "~~ you have chosen: #{user_choice}! Don't worry we wont tell ~~"
        sleep(2)
        break
      else
        user_choice = ''
        prompt('invalid_entry')
        sleep(3)
      end
    end
    # Sets computer choice
    computer_choice = VALID_CHOICES.sample

    prompt('rock_paper_scissors')
    sleep(3)
    puts "~~ The computer choose: #{computer_choice} ~~"
    sleep(2)

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
    sleep(2)

    # Sets game history
    game_history.merge!(set_game_histroy(user_choice,
                                         computer_choice, games_played))

    games_played += 1
    display_final_winner(player_wins, computer_wins)

    # Breaks put of loop if player  or computer win 5
    if player_wins == 5 || computer_wins == 5
      break
    end

    display_score(player_wins, games_played)
    sleep(3)
  end

  display_game_history(game_history)
  sleep(3)

  prompt('play_again')
  final_answer = gets.chomp
  break if final_answer.downcase.start_with?('n')
end
