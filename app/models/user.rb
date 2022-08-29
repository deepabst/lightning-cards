class User < ApplicationRecord

    validates :name, length: { minimum: 2}

    # prevent blank and /or duplicate emails 
    validates :email, presence: true, uniqueness: true
    
    # using 'bcrypt' gem
    has_secure_password

    has_many :decks
end
