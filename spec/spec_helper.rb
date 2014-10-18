require "lib/simple_conway"
require 'rack/test'
require "sinatra"
require "app"

module MockApplication
  def app; Sinatra::Application; end
end

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.include MockApplication
end
