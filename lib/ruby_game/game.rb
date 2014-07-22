require 'gosu'

module RubyGame
	class Game < Gosu::Window		
		def initialize(player, ruby, monsters)
			super(640, 480, false)
			@background_image = Gosu::Image.new(self, File.join(IMAGE_PATH, "background.png"), true)

			@font = Gosu::Font.new(self, Gosu::default_font_name, 60)

			@player = player			
			@ruby = ruby
			@monsters = monsters
			
			([@player, @ruby] + @monsters).each{|object| object.init_image(self)}
		end

		def update
			
			if @state == :run
				@player.move_left if button_down?(Gosu::Button::KbLeft)
				@player.move_right if button_down?(Gosu::Button::KbRight)
				@player.move_up if button_down?(Gosu::Button::KbUp)
				@player.move_down if button_down?(Gosu::Button::KbDown)				
				@monsters.each {|object| object.follow(@player)}
			else
				if button_down?(Gosu::Button::KbSpace)
					@state = :run
					@player = Player.new(self, 200, 300)
					@ruby = Ruby.new(self, 100, 100)
					@monsters = [Monster.new(self), Monster.new(self), Monster.new(self)]
				end					
			end
			
			@monsters.each {|object| self.gameover! if object.touch?(@player)}			
			self.win! if @player.touch?(@ruby)			
		end
		
		def draw
			@background_image.draw(0, 0, 0)
			[@player, @ruby].each {|object| object.draw}
			@monsters.each {|object| object.draw}
			@font.draw("Game Over !", 200, 240, 2, 1.0, 1.0, 0xffffff00) if self.gameover?
			@font.draw("You win !", 200, 240, 2, 1.0, 1.0, 0xffffff00) if self.win?
		end

		def start!
			@state = :run
			self.show
		end	

		def gameover?
			@state == :gameover
		end

		def gameover!
			@state = :gameover
		end

		def win!
			@state = :win
		end

		def win?
			@state == :win
		end
	end
end