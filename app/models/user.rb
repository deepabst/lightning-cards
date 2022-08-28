class User < ApplicationRecord

    # using 'bcrypt' gem
    has_secure_password

    has_many :decks
end
