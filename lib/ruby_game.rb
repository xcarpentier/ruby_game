require_relative "ruby_game/version"
require_relative "ruby_game/game"
require_relative "ruby_game/static_object"
require_relative "ruby_game/player"
require_relative "ruby_game/ruby"


module RubyGame
  ROOT_PATH = File.expand_path('../', File.dirname(__FILE__))
  IMAGE_PATH = File.join(ROOT_PATH, 'app/assets/images')
end
