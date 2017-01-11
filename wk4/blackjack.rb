class Player
  def initialize
    @hand = []
  end

  def deal(card)
    @hand.push(card)
  end

  def hand_value
    sum = 0
    @hand.each do |x|
      sum = sum + x
    end
  end

  def new_hand
    @hand.clear
  end
end

class Dealer
  def initialize
    @hand = []
  end

  def deal(card)
    @hand.push(card)
  end

  def hand_value
    sum = 0
    @hand.each do |x|
      sum = sum + x
    end
  end

  def new_hand
    @hand.clear
  end
end

class Blackjack
  def initialize
    @player = Player.new
    @dealer = Dealer.new
    @deck = [1,2,3,4,5,6,7,8,9,10,10,10,10] * 4
    @deck.shuffle!
  end

  def deal
    2.times do
      @player.deal(@deck.next)
      @dealer.deal(@deck.next)
    end
  end

  def hit
      @player.deal(@deck.next)
      @dealer.deal(@deck.next)
  end

  def new_game
    @player.new_hand
    @dealer.new_hand
    @deck = [1,2,3,4,5,6,7,8,9,10,10,10,10] * 4
    @deck.shuffle!
  end
end  

puts "Welcome to this jank game of Blackjack, would you like to play? Y or N"
answer = gets.chomp
if answer == y
  then player.new_game
else break
end

if players.hand < 17 && dealers.hand > 17
  then 
  puts "Would you like another card? Y or N"
  another = gets.chomp
  if another == y
    then player.hit
  else puts "Ok you stay. The dealer has #{dealer.hand_value}"



if dealers.hand && players.hand == 21
  then 
  puts "Draw. You both got 21."
end

if dealers_hand == 21 && players_hand != 21
  then puts "Sorry, you lose. The dealer has 21."
end

if dealers_hand == 17
  then puts "The dealer has 17. Dealer holds."
end

if dealers_hand > 21
  then puts "The dealers hand is over 21, the dealer busts."
end

if players_hand == 21 && dealers_hand != 21
  then puts "You got 21! You win!"
end

if players_hand == 17
  then puts "The dealer has 17. Dealer holds."
end

if players_hand > 21
  then puts "You bust! You lose!"
end

new_game.new
end
