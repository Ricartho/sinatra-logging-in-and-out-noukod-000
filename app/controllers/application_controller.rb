require_relative '../../config/environment'
class ApplicationController < Sinatra::Base
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get '/' do
    erb :index
  end

  post '/login' do
<<<<<<< HEAD
    username = params[:username]
    pass = params[:password]
    @user = User.find_by(username: username)
    if @user.nil?
      erb :error
    else
      session[:user_id] = @user.id
=======
  login = {:username => params[:username], :password=> params[:password]}
    @user = User.find_by(login)
    if @user.nil?
      erb :error
    else
      session[:user_id] = user.id
>>>>>>> 2e244c29f310a53fc8da8082ebb5337ada7ed1a1
      redirect to '/account'
    end
  end

  get '/account' do
    if !Helpers.is_logged_in?(session)
      erb  :error
    else
      erb :account
    end
  end

  get '/logout' do
    session.clear
    redirect to '/'
  end


end
