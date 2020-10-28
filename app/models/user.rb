class User < ActiveRecord::Base
    validates :name, :email, :password, presence: true
    has_secure_password
    has_many :nailpolishes
    attr_accessor :name, :email, :password

    @@all = []

    def initialize(name, email, password)
        @name = params[:name]
        @email = params[:email]
        @password = params[:password]
        @@all << self

    end

    def self.all
        @@all
    end
    

end