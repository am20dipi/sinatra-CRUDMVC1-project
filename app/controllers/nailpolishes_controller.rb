class NailPolishesController < ApplicationController
    
    get '/' do
    end
  
    get '/nailpolishes' do 
      @nailpolishes = NailPolish.all 
  
      erb :index 
    end
  
  
    get '/nailpolishes/:id' do 
      @nailpolish = NailPolish.new(params[:id])
  
      erb :show 
    end
  
  
    get '/nailpolishes/new' do 
      @users = User.all
      erb :new
    end

end