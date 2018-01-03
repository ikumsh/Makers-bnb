ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'json'
require_relative 'setup'

class Mbnb < Sinatra::Base


  get '/' do
    redirect '/places'
  end

  get '/places' do
    @places = Place.all
    erb :places
  end

  get '/newlisting' do
    erb :new_listing
  end

  post '/newlisting' do

    place = Place.create(title: params[:title], description: params[:description], address: params[:address], price: params[:price])

    redirect '/places'
  end

  run if app_file == $0

end
