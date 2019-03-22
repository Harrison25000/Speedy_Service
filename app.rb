require "sinatra/base"
require './lib/users.rb'

class Services < Sinatra::Base
  enable :sessions

  #SIGNIN ----------------------------------------------------------

  before  do
    path = request.path_info
      if (path != "/signin"  && path != '/signup') && !session[:userid]
      redirect("/signin")
    end
  end

  get '/' do
    redirect '/signin'
  end

  get '/error' do
    erb :error
  end

  get '/welcome' do
    @userid = session[:userid]
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

  get '/signin' do
    erb :index
  end

  post '/signin' do
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      session[:userid] = user.id
      redirect '/welcome'
    else
      erb :error
    end
  end

  #SIGNIN-------------------------------------------------------------

  run! if app_file == $0

end
