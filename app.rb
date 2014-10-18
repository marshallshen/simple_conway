require "sinatra"
require "json"
require_relative "lib/simple_conway"

X_AXIS = "M".freeze
Y_AXIS = "N".freeze
LIVE_CELLS = "liveCells".freeze

post "/next_generation" do
  content_type :json

  halt 400, "Width M is required" unless params[X_AXIS]
  halt 400, "Height N is required" unless params[Y_AXIS]
  halt 400, "liveCells is required" unless (params[LIVE_CELLS])

  x, y = params[X_AXIS].to_i, params[Y_AXIS].to_i
  live_cells = JSON.parse(params[LIVE_CELLS])

  SimpleConway.next_generation(x, y, live_cells).to_json
end
