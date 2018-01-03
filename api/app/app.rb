ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'json'
require_relative 'setup'

class Mbnb < Sinatra::Base

  get '/' do
    "hello world"
  end

  run if app_file == $0

end
