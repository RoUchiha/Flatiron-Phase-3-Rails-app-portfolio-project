class User < ApplicationRecord

    has_secure_password
    validates :username, presence: true, uniqueness: true 
    validates :full_name, presence: true
    validates :email, uniqueness: true, allow_blank: true

    has_many :shows 
    has_many :comments, through: :shows 
    has_many :ratings, through: :shows

    def favorite_shows
        @favs = []
        self.shows.each do |s|
            s.ratings.each do |r|
                if r.score >= 90
                    @favs << s 
                end
            end
        end
        return @favs.sort 
    end

    

end
