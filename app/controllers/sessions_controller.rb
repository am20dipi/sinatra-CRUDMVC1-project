class SessionsController < ApplicationController

    get '/login' do 
        erb :'sessions/login' #rendering 
    end

    post '/login' do 
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password]) #authenticate method is bcrypt working with AR 
            session[:user_id] = user.id #this is the line of code that shows that a user logged in!! 
            erb :'users/home' #to correctly log in the params, we put it in the session. we are persisting it to the next request
        else
            redirect '/login'
        end
    end

    get '/logout' do 
        session.clear
        redirect '/login'
    end

    get '/registrations/signup' do 
        erb :'registrations/signup'
      end 
    
    post '/registrations' do 
        @user = User.new(name: params["name"], email: params["email"], password: params["password"])
        @user.save
        session[:id] = @user.id
    
        redirect '/users/home'
    end

end