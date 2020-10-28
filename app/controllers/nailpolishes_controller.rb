class NailPolishesController < ApplicationController
    
    get '/' do
        erb :welcome
    end
  
    get '/nailpolishes' do 
        @nailpolishes = NailPolish.all #set to an instance variable so it can be seen by the view
        erb :index 
    end
  
    get '/nailpolishes/:id' do # :id puts a key in the params hash
        @nailpolish = NailPolish.find_by(id: params[:id])

        if @nailpolish
            erb :show 
        else
            redirect '/nailpolishes'
        end
    end
  
    get '/nailpolishes/new' do 
        @users = User.all #gives access to the users
        erb :new
    end

    post '/nailpolishes' do 
        user = User.find_by(id: params[:user_id])
        nailpolish = user.nailpolishes.build(params) # .build creates but does NOT SAVE
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
        nailpolish = NailPolish.find_by(id: params[:id])
        if nailpolish.update(name: params[:name], brand: params[:brand], color: params[:color])
            redirect "/nailpolishes/#{nailpolish.id}"
        else
            redirect '/nailpolishes/#{nailpolish.id}/edit'
        end
    end
    
    get '/nailpolishes/:id' do # :id adds the key to the params hash
        @nailpolish = NailPolish.find_by(id: params[:id])
    
        if @nailpolish 
            erb :show
        else
            redirect '/nailpolishes'
        end
    end


    delete '/nailpolishes/:id' do 
        @nailpolish = NailPolish.find_by(id: params[:id])

        @nailpolish.destroy 
        redirect '/nailpolishes'
    end

end