module RubyGame
	class Player
		def initialize(window, x, y)			
			@player_image = Gosu::Image.new(window, File.join(IMAGE_PATH, "player.png"), true)
			@x = x
			@y = y
		end
		
		def draw
			@player_image.draw(@x, @y, 1)
		end
	end
end