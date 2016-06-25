VALID_CHOICES = %w(rock paper scissors)

def prompt(message)
  puts "=> #{message}"
end

def winner?(first, second)
  first == 'rock' && second == 'scissors' ||
    first == 'paper' && second == 'rock' ||
    first == 'scissors' && second == 'paper'
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

  if winner?(player_choice, computer_choice)
    display_winner
  elsif winner?(computer_choice, player_choice)
    display_losser
  else
    display_tie
  end
  prompt('Would you like to play again?')
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end
