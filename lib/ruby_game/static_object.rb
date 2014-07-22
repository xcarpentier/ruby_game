module RubyGame
	class StaticObject		
		def initialize(x, y, image_name)
			@image_name = image_name
			@x = x
			@y = y
		end
		
		def draw
			@image.draw_rot(@x, @y, 1, 0)
		end

		def touch?(object)
			Math.hypot(object.x - @x, object.y - @y) <= 30
		end

		def init_image(window)
			@image = Gosu::Image.new(window, File.join(IMAGE_PATH, @image_name), true)
		end

	end
end