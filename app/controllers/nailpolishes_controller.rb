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

    post '/nailpolishes' do 
        user = User.find_by(id: params[:user_id])
        nailpolish = user.nailpolish.build(params) # .build creates but does NOT SAVE
        if nailpolish.save # .save returns true or false
            redirect "/nailpolishes/#{nailpolish.id}"
        else
            redirect '/nailpolish/new'
        end
    end
    
    get '/nailpolishes/:id/edit' do 
        @nailpolish = NailPolish.find_by(id: params[:id]) 
        erb :edit 
    end
    
    patch '/nailpolishes/:id' do 
        binding.pry
    end
    
    get '/nailpolishes/:id' do # :id adds the key to the params hash
        @nailpolish = NailPolish.find_by(id: params[:id])
    
        if @nailpolish 
            erb :show
        else
            redirect '/nailpolish'
        end
    end

end