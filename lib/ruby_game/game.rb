require 'gosu'

module RubyGame
	class Game < Gosu::Window
		def initialize
			super(640, 480, false)
			@background_image = Gosu::Image.new(self, File.join(IMAGE_PATH, "background.png"), true)

			@font = Gosu::Font.new(self, Gosu::default_font_name, 60)		
		end

		def button_down(id)
			self.restart! if id == Gosu::Button::KbR && !run?
		end

		def player(player)
			@player = player
		end

		def ruby(ruby)
			@ruby = ruby
		end
		
		def monsters(monsters)
			@monsters = monsters
		end

		# %w(player ruby monsters).each do |object|
		# 			define_method "#{object}" do
		#   			instance_variable_set("@#{object}", object)
		# 		end
		# end		

		def update			
			if run?
				@player.move_left if button_down?(Gosu::Button::KbLeft)
				@player.move_right if button_down?(Gosu::Button::KbRight)
				@player.move_up if button_down?(Gosu::Button::KbUp)
				@player.move_down if button_down?(Gosu::Button::KbDown)				
				@monsters.each {|object| object.follow(@player)}			
			end
			
			@monsters.each {|object| self.gameover! if object.touch?(@player)}			
			self.win! if @player.touch?(@ruby)			
		end
		
		def draw
			@background_image.draw(0, 0, 0)
			([@player, @ruby] + @monsters).each {|object| object.draw}			
			@font.draw("Game over !", 200, 240, 2, 1.0, 1.0, 0xffffff00) if self.gameover?
			@font.draw("You won !", 200, 240, 2, 1.0, 1.0, 0xffffff00) if self.win?
		end

		def start!(&conf)
			
			if block_given?
				@block = conf
				conf.call(self)
			else
				@block.call(self)
			end

			([@player, @ruby] + @monsters).each{|object| object.init_image(self)}
			run!
			self.show if block_given?
		end	

		%w(win run gameover).each do |state|
  			define_method "#{state}?" do
    			@state == state.to_sym
 			end

 			define_method "#{state}!" do
    			@state = state.to_sym
 			end
		end

		alias_method :restart!, :start!
	end
end