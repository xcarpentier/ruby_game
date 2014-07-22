module RubyGame
	class Player < StaticObject
		def initialize(window, x, y)			
			super(window, x, y, "player.png")
		end
	end
end