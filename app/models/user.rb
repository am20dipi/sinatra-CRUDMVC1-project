class User < ActiveRecord::Base
    #validates :name, :email, :password, presence: true
    has_secure_password
    has_many :nailpolishes

    @@all = []

    def initialize(email, password)
        @email = params[:email]
        @password = params[:password]
        @@all << self

    end

    def self.all
        @@all
    end
    

end