module RubyGame
	class Monster < StaticObject
		def initialize(window, x = rand(100...500), y = rand(100...500), velocity = 1)
			super(window, x, y, "ghost1.png")
			@velocity = velocity
		end

		def follow(player)
			@x -= (@x <=> player.x) * @velocity
			@y -= (@y <=> player.y) * @velocity
		end		

	end
end