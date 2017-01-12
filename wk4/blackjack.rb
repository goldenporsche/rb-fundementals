class Player
  def initialize
    @hand = []
    @sum = 0
  end

  def take_card(card)
    @hand.push(card)
    @sum = @sum + card
  end

  def ask
    gets.chomp
  end  

  def bust?
    @sum > 21
  end

  def blackjack?
    @sum == 21
  end

  def to_s
    "Player: #{@hand.to_s} = #{@sum}"
  end

  def to_i
    @sum
  end

  def diff
    21 - @sum
  end
end

class Dealer < Player
  def ask
    sleep 2
    if @sum < 17
      'h'
    else
      's'
    end    
  end

  def to_s
    "Dealer: #{@hand.to_s} = #{@sum}"
  end

  def to_s_initial
    "Dealer: [#{@hand.first}, X]"
  end
end

class Blackjack
  def initialize
    @player = Player.new
    @dealer = Dealer.new
    @deck = [1,2,3,4,5,6,7,8,9,10,10,10,10] * 4
    @deck.shuffle!
    @e_deck = @deck.to_enum
  end

  def play
    deal    
    play_turn(@player)
    if @player.bust?
      print
      puts "You lose"
    else
      play_turn(@dealer)  
      if @dealer.bust? || @player.diff < @dealer.diff
        print_full
        puts "You win!"
      else
        print_full
        puts "You tied!"
      end
    end
  end

  def play_turn(person)    
    while !person.bust? || person.blackjack?
      person.class == Player ? print : print_full
      puts "Hit or stay? (h/s)"
      answer = person.ask       
      if answer == 'h'
        hit(person)
      else
        break
      end      
    end
  end  

  def deal
    2.times do
      @player.take_card(@e_deck.next)
      @dealer.take_card(@e_deck.next)
    end
  end

  def hit(person)
    person.take_card(@e_deck.next)
  end

  def print
    puts @player.to_s
    puts @dealer.to_s_initial
  end

  def print_full
    puts @player.to_s
    puts @dealer.to_s
  end

end

# Play the game
play = 'y'
while play == 'y'
  game = Blackjack.new
  game.play
  puts "Play again? (y/n)"
  play = gets.chomp
end

# if player.hand < 17 && dealer.hand > 17
#   then 
#   puts "Would you like another card? Y or N"
#   another = gets.chomp
#   if another == y
#     then player.hit
#     else puts "Ok you stay. The dealer has #{dealer.hand_value}"
#   end
# end

# if dealers.hand && players.hand == 21
#   then puts "Draw. You both got 21."
# end

# if dealers_hand == 21 && players_hand != 21
#   then puts "Sorry, you lose. The dealer has 21."
# end

# if dealers_hand == 17
#   then puts "The dealer has 17. Dealer holds."
# end

# if dealers_hand > 21
#   then puts "The dealers hand is over 21, the dealer busts."
# end

# if players_hand == 21 && dealers_hand != 21
#   then puts "You got 21! You win!"
# end

# if players_hand == 17
#   then puts "The dealer has 17. Dealer holds."
# end

# if players_hand > 21
#   then puts "You bust! You lose!"
# end