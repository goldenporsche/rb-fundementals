class Player
  def initialize(cards)
    @cards = cards    
  end 
end

class Dealer
  def initialize(cards)
    @cards = cards    
  end
end

class Game
  def deal
    cards
    2.times { cards << rand(1..10) }
    cards
  end
end

def play_blackjack(deal)

dealers_cards = Array.new
players_cards = Array.new

"dealers_card_1" = rand(1..10)
"dealers_card_2" = rand(1..10)
dealers_cards = ["dealers_card_1", "dealers_card_2"]
puts "dealers_card_1"
dealers_hand = "dealers_card_1" + "dealers_card_2"

if dealers_hand == 21
  then puts "Sorry, you lose. The dealer has 21."

if dealers_hand == 17
  then puts "The dealer has 17. Dealer holds."

if dealers_hand > 21
  then puts "The dealers hand is over 21, the dealer folds."


