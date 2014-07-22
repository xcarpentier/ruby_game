require 'gosu'

module RubyGame
	class Game < Gosu::Window
		def initialize
			super(640, 480, false)
			@background_image = Gosu::Image.new(self, File.join(IMAGE_PATH, "background.png"), true)
			@player = Player.new(self, 200, 300)
			@ruby = Ruby.new(self, 100, 100)
		end

		def update
			@player.move_left if button_down?(Gosu::Button::KbLeft)
			@player.move_right if button_down?(Gosu::Button::KbRight)
			@player.move_up if button_down?(Gosu::Button::KbUp)
			@player.move_down if button_down?(Gosu::Button::KbDown)
		end
		
		def draw
			@background_image.draw(0, 0, 0)
			[@player, @ruby].each {|object| object.draw} 			
		end

		def start!
			self.show
		end	
	end
end

