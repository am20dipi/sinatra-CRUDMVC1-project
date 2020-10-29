class User < ActiveRecord::Base
    validates :name, :email, :password, presence: true
    has_secure_password
    has_many :nailpolishes
    validates_uniqueness_of :email
    
end