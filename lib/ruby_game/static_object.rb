module RubyGame
	class StaticObject
		def initialize(window, x, y, image_name)
			@image = Gosu::Image.new(window, File.join(IMAGE_PATH, image_name), true)
			@x = x
			@y = y
		end
		
		def draw
			@image.draw(@x, @y, 1)
		end
	end
end