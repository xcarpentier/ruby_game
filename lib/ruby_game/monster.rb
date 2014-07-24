module RubyGame
	class Monster < StaticObject
		def initialize(image_name = "ghost1", velocity = 1, x = rand(100...500), y = rand(100...500))
			super(x, y, image_name)
			@velocity = velocity
		end

		@@monster_types = {}

		def self.monster_types
			@@monster_types
		end

		def self.define(monster_name, &block)			
			monster = Monster.new
			yield(monster)			
			@@monster_types[monster_name] = monster
		end

		def self.build(monster_type, number_of_monster)
			monsters = []			
			number_of_monster.times do 
				rand_pos = @@monster_types[monster_type].clone 
				rand_pos.x = rand(100...500)
				rand_pos.y = rand(100...500)
				monsters << rand_pos
			end			
			monsters
		end

		def to_s
			"x: #{@x}, y: #{@y}, image: #{@image_name}, velocity: #{@velocity}"
		end

		def follow(player)
			@x -= (@x <=> player.x) * @velocity
			@y -= (@y <=> player.y) * @velocity
		end

		def image_name(image_name)
			@image_name = image_name
		end

		def velocity(velocity)
			@velocity = velocity
		end
	end
end