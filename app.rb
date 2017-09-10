require 'sinatra'
require 'config_env'
require 'httparty'
ConfigEnv.init("#{__dir__}/config/env.rb")

set :port, 3000

get '/' do
  @api_key = ENV['API_KEY']
  res = HTTParty.get(
    "http://api.openweathermap.org/data/2.5/weather?q=London&APPID=#{ENV['API_KEY']}"
  )
  @data = JSON.parse(res.body)
  @temp = (@data['main']['temp'] * 9 / 5 - 459.67).floor

  erb :index
end
