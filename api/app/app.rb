ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'json'
require_relative 'setup'

class Mbnb < Sinatra::Base

  get '/' do
    redirect '/places'
  end

  get '/places' do
    erb :places
  end

  get '/newlisting' do
    erb :new_listing
  end

  post '/newlisting' do
    redirect '/places'
  end

  run if app_file == $0

end
