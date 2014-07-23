module RubyGame	
	class Ruby < StaticObject
		attr_reader :x, :y
		def initialize(x = rand(100...500), y=rand(100...500))
			super(x, y, "ruby.png")			
		end
	end
end