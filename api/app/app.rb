ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'json'
require_relative 'setup'
require 'sinatra/flash'
require_relative 'helpers'

class Mbnb < Sinatra::Base
  include BCrypt
  register Sinatra::Flash
  enable :sessions
  set :session_secret, 'session'
  helpers Helpers

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

  get '/users/new' do
    erb :'/users/new'
  end

  post '/users' do
    @user = User.create(email: params[:email],
                name: params[:name],
                password: params[:password],
                password_confirmation: params[:password_confirmation])

    if @user.save
      session[:user_id] = @user.id
      redirect '/places'
    else
      flash.now[:error] = @user.errors.values.join("<br>")
      erb :'/users/new'
    end
  end

  run if app_file == $PROGRAM_NAME
end
