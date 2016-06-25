VALID_CHOICES = %w("rock", "paper", "scissors")

def prompt(message)
  puts "=> #{message}"
end

def winning_condition?(player, computer)
  player == 'rock' && computer == 'scissors' ||
    player == 'paper' && computer == 'rock' ||
    player == 'scissors' && computer == 'paper'
end

def lossing_conditions?(player, computer)
  computer == 'rock' && player == 'scissors' ||
    computer == 'paper' && player == 'rock' ||
    computer == 'scissors' && player == 'paper'
end

def display_winner
  prompt('YOU WON!')
end

def display_losser
  prompt('You lost... try again?')
end

def display_tie
  prompt("It's a tie!")
end

prompt('ROCK, PAPER, SCISSORS, Say shoot!')
sleep(1)
player_choice = ''
loop do
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    player_choice = gets.chomp.downcase

    if VALID_CHOICES.include?(player_choice)
      break
    else
      prompt("That is not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample
  prompt("You chose #{player_choice}, the computer chose #{computer_choice}")

  if winning_condition?(player_choice, computer_choice)
    display_winner
  elsif lossing_conditions?(player_choice, computer_choice)
    display_losser
  else
    display_tie
  end
  prompt('Would you like to play again?')
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end
