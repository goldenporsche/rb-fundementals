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

  def initialize
    @suspects = get_suspects
    @secret = @suspects.shuffle!.first
  end

  def play
    puts "What do you want to guess? (gender, skin_color, hair_color, eye_color)"
    input = gets.chomp
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
    end

    guess = gets.chomp
    remove_suspects(type, guess)
    puts "Remaining Suspects:"
    puts suspects.join("\n\n")
  
end

  def remove_suspects(type, guess)
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
