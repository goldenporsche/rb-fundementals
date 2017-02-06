class Game
  CHOICES = ["rock", "paper", "scissors"]
  def initialize
    puts "Thanks for playing!"
    @rounds = 0
    while @rounds == 0 || (@rounds % 2) != 1
      puts "How many rounds do you want to play? Please choose an odd number."
      @rounds = gets.chomp.to_i
    end
    puts "Great, we'll play #{@rounds} rounds."
    @to_win = (@rounds / 2) + 1
    @player, @computer = 0, 0
  end

  def play
    round = 1
    while @player != @to_win && @computer != @to_win
      sleep 1
      puts "\nRound #{round}!"
      outcome = compare(player_choice, computer_choice)
      sleep 2
      if outcome == "player"
        puts "Player wins round #{round}"
        @player = @player + 1
      elsif outcome == "computer"
        puts "Computer wins round #{round}"
        @computer = @computer + 1
      else
        puts "Round #{round} is a tie!"
      end
      round = round + 1
    end
    if @player == @to_win
      puts "You win!"
    else
      puts "You lose!"
    end
  end

  private

  def player_choice    
    puts "Choose #{CHOICES.join(", ")}. What's your choice?"
    choice = gets.chomp.downcase[0]
    while !CHOICES.map(&:initial).include?(choice)
      puts "That's not a valid choice. Try again."
      choice = gets.chomp.downcase.initial
    end
    choice
  end

  def computer_choice
    choice = CHOICES[rand(CHOICES.length)]
    sleep 2
    puts "Computer chooses #{choice}"
    choice.initial
  end

  def compare(player, computer)
    if (player == computer)
      return "tie"
    elsif (player == "rock" && computer == "scissors") || (player == "paper" && computer == "rock") || (player == "scissors" && computer == "paper")
      return "player"
    else
      return "computer"
    end
  end
end

class String
  def initial
    self[0,1]
  end
end

game = Game.new
game.play


