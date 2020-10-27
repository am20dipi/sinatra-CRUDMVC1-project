class NailPolish < ActiveRecord::Base
    belongs_to :users
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

end