class NailPolishesController < ApplicationController
  
    get '/nailpolishes' do 
        if logged_in? 
            #binding.pry
            @nailpolishes = current_user.nailpolishes 
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
        if logged_in?
            nailpolish = current_user.nailpolishes.build(params) 
            if nailpolish.save 
                redirect "/nailpolishes/#{nailpolish.id}"
            else
                redirect '/nailpolishes/new'
            end
        else 
            redirect '/login'
        end
    end
  
    get '/nailpolishes/:id' do 
        if logged_in?
            @nailpolish = current_user.nailpolishes.find_by(id: params[:id])
    
            if @nailpolish 
                erb :'nailpolishes/show' 
            else
                redirect '/nailpolishes' 
            end
        else
            redirect '/login'
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
    
    patch '/nailpolishes/:id' do 
        if logged_in?
            nailpolish = current_user.nailpolishes.find_by(id: params[:id])
            nailpolish.update(name: params[:name], brand: params[:brand], color: params[:color])
                
            redirect "/nailpolishes/#{nailpolish.id}"
        else
            redirect "/login"
        end
    end
    

    delete '/nailpolishes/:id' do 
        if logged_in?
            @nailpolish = current_user.nailpolishes.find_by(id: params[:id])
            if @nailpolish
                @nailpolish.destroy 
            end
            redirect '/nailpolishes'
        else
            redirect '/login'
        end
    end

end