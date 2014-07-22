module RubyGame	
	class Player < StaticObject
		attr_reader :x, :y
		def initialize(x, y)
			super(x, y, "player.png")			
		end

		def move_left
			@x -= 3 if @x > 0
		end

		def move_right
			@x += 3 if @x < @window.width
		end

		def move_up
			@y -= 3 if @y > 0
		end

		def move_down 			
			@y += 3 if @y < @window.height
		end
	end
end