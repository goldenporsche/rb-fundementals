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


if dealers_hand == 21
then puts "Sorry, you lose. The dealer has 21."

if dealers_hand == 17
then puts "The dealer has 17. Dealer holds."

if dealers_hand > 21
then puts "The dealers hand is over 21, the dealer busts."


