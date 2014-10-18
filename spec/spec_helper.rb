require "benchmark"
require "rack/test"
require "sinatra"
require "lib/simple_conway"
require "app"

module MockApplication
  def app; Sinatra::Application; end
end

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.include MockApplication
  config.filter_run_excluding performance: true
end
