class SessionsController < ApplicationController

    get '/login' do 
        erb :'sessions/login' #rendering 
    end

    post '/login' do 
        user = User.find_by(email: params[:email])
        session[:email] = params[:email] #to correctly log in the params, we put it in the session. we are persisting it to the next request
        redirect '/nailpolishes'
    end

end