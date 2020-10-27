class User < ActiveRecord::Base
    validates_presence_of :name, :email, :password
    has_many :nail_polishes
end