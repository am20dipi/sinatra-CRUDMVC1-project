class NailPolish < ActiveRecord::Base
    belongs_to :user
    validates :name, :brand, :color, presence: true 

    @@all = []

    def initialize(name, brand, color)
        @name = params[:name]
        @brand = params[:brand]
        @color = params[:color]
        @@all << self
    end

    def self.all 
        @@all << self
    end
    

end