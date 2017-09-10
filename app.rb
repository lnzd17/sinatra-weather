require 'sinatra'
require 'config_env'
require 'uri'
require_relative 'models/weather.rb'
ConfigEnv.init("#{__dir__}/config/env.rb")

set :port, 3000

get '/' do
  @cities = [
      "San Francisco",
      "London",
      "Tokyo",
      "Moscow",
      "Cairo",
      "New York City",
      "Miami",
      "Boise"
    ]
  @city = params[:city] || "New York City"
  weather = Weather.new(@city)
  @temp = weather.temp
  erb :index
end
