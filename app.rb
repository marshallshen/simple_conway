require "sinatra"
require "sinatra/jsonp"
require_relative "lib/simple_conway"

X_AXIS = "M".freeze
Y_AXIS = "N".freeze
LIVE_CELLS = "liveCells".freeze
CALLBACK = "callback".freeze

get "/next_generation" do
  halt 400, "Width M is required" unless params[X_AXIS]
  halt 400, "Height N is required" unless params[Y_AXIS]
  halt 400, "liveCells is required" unless (params[LIVE_CELLS])
  halt 400, "jQuery callback is required" unless (params[CALLBACK] && params[CALLBACK] =~ /jQuery/)

  x, y = params[X_AXIS].to_i, params[Y_AXIS].to_i
  live_cells = params[LIVE_CELLS].values.map!{|cell| [cell.first.to_i, cell.last.to_i]}

  jsonp SimpleConway.next_generation(x, y, live_cells)
end
