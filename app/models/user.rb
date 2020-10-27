class User < ActiveRecord::Base
    validates_presence_of :name, :email, :password
    has_many :nailpolishes

    def initialize(name, email, password)
        @name = name
        @email = email
        @password = password
        @@all << self
    end

    def self.all 
        @@all
    end

end