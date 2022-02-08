class User < ApplicationRecord

    has_secure_password

    has_many :shows 
    has_many :comments, through: :shows 
    has_many :ratings, through: :shows


end
