CARD_FACES = [2, 3, 4, 5, 6, 7, 8, 9, 'J', 'Q', 'K', 'A'].freeze
CARD_SUITES = %w(Clubs Diamond Hearts Spades).freeze

# Create deck
# Deal cards to each player
# Ask player to stay or hit
# dealer hit if under 17
# compute hands
# return winner

def prompt(message)
  puts "-> #{message}"
end

def initailize_deck
  CARD_SUITES.product(CARD_FACES).shuffle
end

def initailize_deal(player, dealer, deck)
  2.times do
    player << deck.pop
    dealer << deck.pop
  end
end

def display_hands(hand_1, hand_2)
  puts "Your current hand is: "
  hand_1.each do |k, v|
    puts "#{v} of #{k}"
  end
  puts "The deal is showing:"
    hand_2
end

loop do
  system 'clear'
  prompt('Welcome to Ruby 21.')
  loop do
    prompt('Do you know the rules? y/n')
    answer = gets.chomp.downcase

    if answer == "y"
      break
    elsif answer == 'n'
      prompt("This is a basic 21 game you will be dealt cards try not to go
      over 21.")
    else
      prompt("Error invalid input!")
    end
  end

  game_deck = initailize_deck
  player_hand = []
  dealer_hand = []

  initailize_deal(player_hand, dealer_hand, game_deck)
  display_hands(player_hand, dealer_hand)
  sleep(4)
end
