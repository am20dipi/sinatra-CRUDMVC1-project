require './config/environment'

class ApplicationController < Sinatra::Base

   configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password"
  end

  get '/' do 
    erb :welcome
  end

  get '/login' do
    erb :'sessions/login'
  end

  helpers do 
    def logged_in?
      !!session[:user_id] #double bang will result in true or false; is someone logged in? is a user id in the session hash??
    end

    def current_user
      @user ||= User.find_by(id:session[:user_id]) if logged_in? #why do we use the OREQUAL sign > is there a user? if not then hand one thru (called memoization)
    end
  end

end
