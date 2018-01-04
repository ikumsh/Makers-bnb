ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'
require 'json'
require_relative 'setup'
require_relative 'helpers'


class Mbnb < Sinatra::Base
  include BCrypt
  enable :sessions
  set :session_secret, 'session'
  register Sinatra::Flash
  register Sinatra::Partial
  use Rack::MethodOverride
  set :partial_template_engine, :erb
  helpers Helpers
  enable :partial_underscores


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

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    @user = User.authenticate(params[:email], params[:password])
    if @user
      session[:user_id] = @user.id
      redirect '/places'
    else
      flash.now[:error] = 'Email or password is incorrect'
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:logout] = 'You have logged out successfully'
    redirect to '/places'
  end

  get '/place_id' do
    redirect("/places/#{place.id}")
  end

  run if app_file == $PROGRAM_NAME
end
