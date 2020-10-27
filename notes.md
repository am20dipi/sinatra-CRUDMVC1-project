get '/' do
    erb :welcome
  end

  get '/registrations/signup' do
    erb :'/registrations/signup'
  end

  post '/registrations' do
    @user = User.new(name: params["name"], email: params["email"], password: params["password"])
    @user.save
    session[:id] = @user.id

    redirect '/users/home'
  end

  get '/sessions/login' do
    erb :'sessions/login'
  end

  post '/sessions' do
    @user = User.find_by(email: params["email"], password: params["password"])
    session[:id] = @user.id
    redirect '/users/home'
  end

  get '/sessions/logout' do
    session.clear
    redirect '/'
  end

  get '/users/home' do
    @user = User.find(session[:id])
    erb :'/users/home'
  end




  this was in show.erb
    <form method="POST" action="/nailpolishes/<%= @nailpolish.id %>/delete">
            <input id="hidden" type="hidden" name="_method" value="delete">
            <input type="submit" value="delete">
        </form>




this was in user.rb
def initialize(name, email, password)
        @name = name
        @email = email
        @password = password
        @@all << self
    end

    def self.all 
        @@all
    end


this was in nailpolish.rb
attr_accessor :name, :brand, :color

    @@all = []

    def initialize(name, brand, color)
        @name = name
        @brand = brand
        @color = color 
        @@all << self
    end

    def self.all
        @@all
    end