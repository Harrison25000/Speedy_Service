require "sinatra/base"
require './lib/users.rb'

class Services < Sinatra::Base
  enable :sessions

  get '/signin' do
    erb :index
  end

  get '/welcome' do
    erb :welcome
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    @user = User.create(
      username: params[:username],
      password: params[:password],
      email: params[:email]
    )
    session[:userid] = @user.id
    redirect "/signin"
  end

  run! if app_file == $0

end
