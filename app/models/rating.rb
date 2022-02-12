class Rating < ApplicationRecord

    scope :favorite_shows, -> { where("score >= 90")}

    belongs_to :show
    validates :score, presence: true
    

end
