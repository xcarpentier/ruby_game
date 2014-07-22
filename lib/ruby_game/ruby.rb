module RubyGame	
	class Ruby < StaticObject
		attr_reader :x, :y
		def initialize(x, y)			
			super(x, y, "ruby.png")			
		end
	end
end