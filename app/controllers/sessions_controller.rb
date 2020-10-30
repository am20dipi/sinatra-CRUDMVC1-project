class SessionsController < ApplicationController

    get '/login' do 
        erb :'sessions/login' #rendering 
    end

    post '/login' do 
        user = User.find_by(email: params[:email])
        #binding.pry
        if user && user.authenticate(params[:password]) #authenticate method is bcrypt working with AR 
            session[:user_id] = user.id #this is the line of code that shows that a user logged in!! 
            erb :'nailpolishes/index' #to correctly log in the params, we put it in the session. we are persisting it to the next request
        else
            redirect '/login'
        end
    end

    get '/logout' do 
        session.clear
        redirect '/'
    end


end