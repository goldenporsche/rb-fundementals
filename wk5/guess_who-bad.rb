class Suspect
	attr_reader :name, :gender, :skin, :hair, :eye

	def initialize(name,gender,skin,hair,eye)
		@name = name
		@gender = gender
		@skin = skin
		@hair = hair
		@eye = eye
	end

s = Suspect.new('rachel','girl','black','auburn','brown')


class Game
	def initialize
		@suspects = []
	end

	#private

	def get_suspects
		File.open("seed.txt", "r").each_line do |line|
  		data = line.split
  		puts data
  	
	end
end

end

g = Game.new
g.gets_suspects











end
