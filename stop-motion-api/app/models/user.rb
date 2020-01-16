class User < ApplicationRecord
    has_many :films
    has_secure_password
    validates :username, :email, presence: true
    validates :username, :email, uniqueness: { case_sensitive: false }

    def token
        JWT.encode({ user_id: self.id }, ENV['RAILS_SECRET'])
    end 
    
end
