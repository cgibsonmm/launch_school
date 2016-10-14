require 'pry'

CARD_FACE = %w(2 3 4 5 6 7 8 9 J Q K A).freeze
CARD_SUITS = %w(Spades Clubs Diamonds Hearts).freeze
GAME_SCORE = 21
DEALER_LIMIT = 17

def prompt(message)
  puts "=> #{message}"
end

def initialize_deck
  CARD_SUITS.product(CARD_FACE).shuffle
end

def init_deal(player, dealer, deck)
  2.times do
    player << deck.pop
    dealer << deck.pop
  end
end

def hand_total(cards)
  hand = cards.map { |card| card[1] }

  sum = 0
  hand.each do |card|
    sum += if card == "A"
             11
           elsif card.to_i == 0
             10
           else
             card.to_i
           end
  end

  hand.select { |value| value == "A" }.count.times do
    sum -= 10 if sum > 21
  end
  sum
end

def update_total(player)
  hand_total(player)
end

def bust?(hand)
  if hand_total(hand) > GAME_SCORE
    true
  end
end

def card_display(card)
  "#{card.last} of #{card.first}"
end

def init_display_hands(player, dealer)
  puts ""
  prompt "The dealer has a: #{card_display(dealer[0])} and ???"
  puts ""
  prompt "You have: #{card_display(player[0])}, \
and a #{card_display(player[1])}"
  prompt "Your hand total is: #{hand_total(player)}"
end

def display_hand(player, dealer)
  system 'clear'
  prompt "Your hand:"
  player.each_with_index do |_, index|
    prompt "x #{card_display(player[index])}"
  end
  prompt "your hand totals #{hand_total(player)}"
  puts ""
  prompt "The dealer is showing: #{card_display(dealer[0])}"
end

def display_ending_hands(player, dealer)
  puts "========="
  prompt "Your hand is:"
  player.each do |card|
    prompt card_display(card).to_s
  end
  prompt "for a total of: #{hand_total(player)}"
  puts "========="
  prompt "The dealers hand is:"
  dealer.each do |card|
    prompt card_display(card).to_s
  end
  prompt "The dealers total is: #{hand_total(dealer)}"
end

def determin_winner(player, dealer)
  player_total = hand_total(player)
  dealer_total = hand_total(dealer)

  if player_total > GAME_SCORE
    :player_busted
  elsif dealer_total > GAME_SCORE
    :dealer_busted
  elsif dealer_total < player_total
    :player
  else
    :dealer
  end
end

def display_results(result)
  case result
  when :player_busted
    prompt "You busted, better luck next time!"
  when :dealer_busted
    prompt "You win, the dealer busted"
  when :player
    prompt "You win!"
  when :dealer
    prompt "The dealer won."
  end
end

loop do
  system 'clear'
  game_deck = initialize_deck
  player_hand = []
  player_total = 0
  dealer_hand = []
  dealer_total = 0

  prompt "Welcome to 21, DON'T BUST!"
  sleep(0.5)
  prompt "Shuffing cards, and dealing the deck!"
  sleep(1)
  init_deal(player_hand, dealer_hand, game_deck)
  init_display_hands(player_hand, dealer_hand)

  loop do # player hit or stay loop
    player_total = hand_total(player_hand)
    break if bust?(player_hand) || player_total == GAME_SCORE

    prompt "Would you like to (H)it or (S)tay?"
    answer = gets.chomp.downcase
    break if answer.start_with?('s')
    prompt "error" unless answer.start_with?('h', 's')

    next unless answer.start_with?('h')
    player_hand << game_deck.pop
    player_total = hand_total(player_hand)
    prompt "you drew a: #{card_display(player_hand.last)}"
    prompt "Your new hand total is #{player_total}"
  end

  loop do # dealer hit or stay
    break if bust?(player_hand)
    prompt "The dealers turn!"
    loop do
      dealer_total = hand_total(dealer_hand)

      break if bust?(dealer_hand)
      if dealer_total >= DEALER_LIMIT
        prompt "The dealer stays."
        break
      elsif dealer_total < DEALER_LIMIT
        prompt "The dealer hits."
        dealer_hand << game_deck.pop
        sleep(0.5)
      end
    end
    break
  end

  sleep(2)
  display_ending_hands(player_hand, dealer_hand)
  results = determin_winner(player_hand, dealer_hand)
  display_results(results)

  play_again = ''
  loop do
    prompt "Would you like to play again? (Y)es or (N)o"
    play_again = gets.chomp.downcase
    break if play_again.start_with?("y", "n")
    prompt "Error, invalid answer."
  end
  break if play_again.start_with?('n')
end
