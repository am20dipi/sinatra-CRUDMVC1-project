class NailPolish < ActiveRecord::Base
    belongs_to :user
    validates :name, :brand, :color, presence: true 
    

end