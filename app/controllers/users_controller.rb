class UsersController < ApplicationController

    get '/signup' do 
        erb :'users/signup'
      end 
    
    post '/signup' do 
        @user = User.new(name: params["name"], email: params["email"], password: params["password"])
        @user.save
        session[:id] = @user.id
    
        redirect '/nailpolishes'
    end
end