class Suspect
  attr_reader :name, :gender, :skin, :hair, :eye

  def initialize(name, gender, skin, hair, eye)
    @name = name
    @gender = gender
    @skin = skin
    @hair = hair
    @eye = eye
  end

  def to_s
    "Name: #{@name.capitalize}\nGender: #{@gender}\nSkin: #{@skin}\nHair: #{@hair}\nEye: #{@eye}"
  end

end

class Game
  attr_reader :suspects
  HAIR_COLOR = [:pink, :blue]

  def initialize
    @suspects = get_suspects
    @secret = @suspects.shuffle!.first
    @name = false
    @guesses = 3
  end

  def play
    if @name
      input = "name"
    else
      puts "What do you want to guess? (gender, skin_color, hair_color, eye_color)"
      input = gets.chomp
    end
    case input
      when "gender"
        puts "girl or boy?"
        type = "gender"
      when "skin_color"
        puts "black or white"
        type = "skin"
      when "hair_color"
        puts "blonde, black, brown, auburn"
        type = "hair"
      when "eye_color"
        puts "green, brown, blue"
        type = "eye"  
      when "name"
        puts @suspects.map{ |suspect| suspect.name }.join(", ")
        type = "name"
    end

    guess = gets.chomp
    match = check_guess(type, guess)
    puts "Remaining Suspects:"
    puts suspects.join("\n\n")
    if type == "name" && match
      puts "You win!"
    elsif @suspects.length < 5 && @guesses > 0
      @guesses = @guesses - 1
      @name = true 
      puts "Try to guess the suspects name."
      play
    elsif @guesses == 0 
      puts "Sorry, you lost."
    else
      play
    end
  end

  def check_guess(type, guess)
    method = type.to_sym
    match = false
    if @secret.send(method) == guess
      match = true
    end
    @suspects = @suspects.delete_if do |suspect|
      if suspect.send(method) == guess
          !(match && true)
      else
          match && true
      end
    end
    match
  end

  private

  def get_suspects
    suspects = []
    File.open("seed.txt", "r").each_line do |line|
      data = line.split
      suspects << Suspect.new(*data)
    end
    suspects
  end
end

g = Game.new
g.play
