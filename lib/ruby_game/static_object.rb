module RubyGame
	class StaticObject
		def initialize(window, x, y, image_name)
			@image = Gosu::Image.new(window, File.join(IMAGE_PATH, image_name), true)
			@x = x
			@y = y
			@window = window
		end
		
		def draw
			@image.draw_rot(@x, @y, 1, 0)
		end

		def touch?(object)
			Math.hypot(object.x - @x, object.y - @y) <= 30
		end
	end
end