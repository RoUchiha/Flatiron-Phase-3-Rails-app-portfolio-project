class Review < ApplicationRecord

    has_many :ratings
    has_many :shows, through: :ratings 

end
