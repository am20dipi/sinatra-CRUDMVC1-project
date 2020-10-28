class NailPolishesController < ApplicationController
  
    get '/nailpolishes' do 
        if logged_in? 
            @nailpolishes = current_user.nailpolishes #set to an instance variable so it can be seen by the view; asking to give the collection of the logged-in users only
            erb :'nailpolishes/index' 
        else 
            redirect '/login'
        end
    end

    get '/nailpolishes/new' do 
        if logged_in?
            erb :'nailpolishes/new'
        else
            redirect '/login'
        end
    end

    post '/nailpolishes' do 
        nailpolish = current_user.nailpolishes.build(params) # .build creates but does NOT SAVE
        if nailpolish.save # .save returns true or false
            redirect "/nailpolishes/#{nailpolish.id}"
        else
            redirect '/nailpolish/new'
        end
    end
  
    get '/nailpolishes/:id' do # :id puts a key in the params hash
        @nailpolish = NailPolish.find_by(id: params[:id])

        if @nailpolish
            erb :show 
        else
            redirect '/nailpolishes'
        end
    end
    
    get '/nailpolishes/:id/edit' do 
        if logged_in? 
            @nailpolish = current_user.nailpolishes.find_by(id: params[:id]) 
            if @nailpolish 
                erb :'nailpolishes/edit'
            else
                redirect '/nailpolishes'
            end
        else 
            redirect '/login'
        end
    end
    
    patch '/nailpolishes/:id' do #patch comes from rackmethodoverride; it is looking for key "_method"; if so the value associate is patch
        nailpolish = current_user.nailpolishes.find_by(id: params[:id])
        if nailpolish.update(name: params[:name], brand: params[:brand], color: params[:color])
            redirect "/nailpolishes/#{nailpolish.id}"
        else
            redirect '/nailpolishes/#{nailpolish.id}/edit'
        end
    end
    
    get '/nailpolishes/:id' do # :id adds the key to the params hash
        if logged_in?
            @nailpolish = current.user.nailpolishes.find_by(id: params[:id])
    
            if @nailpolish 
                erb :'nailpolishes/show' #renders the show view
            else
                redirect '/nailpolishes' #redirects to the route
            end
        else
            redirect '/login'
        end
    end


    delete '/nailpolishes/:id' do 
        if logged_in?
            @nailpolish = current_user.nailpolishes.find_by(id: params[:id])
            @nailpolish.destroy 
            redirect '/nailpolishes'
        else
            redirect '/login'
        end
    end

end