module RubyGame	
	class Ruby < StaticObject
		attr_reader :x, :y
		def initialize(window, x, y)			
			super(window, x, y, "ruby.png")			
		end
	end
end