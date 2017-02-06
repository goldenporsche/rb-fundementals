deck = []
suits = %w[ Hearts Diamonds Clubs Spades ]
values = %w[ Ace 2 3 4 5 6 7 8 9 10 Jack Queen King ]
suits.each do |suit|
  values.each do |value|
    deck << "#{value} of #{suit}"
  end
end
hand = deck
hand.shuffle!
puts hand.join(", ")


class Cards
	def initialize
		@deck = deck
	end
end

class Player
	def initialize
		@hand = hand
	end
end

class Game
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end


