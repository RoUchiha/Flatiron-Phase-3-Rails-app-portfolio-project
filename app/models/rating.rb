class Rating < ApplicationRecord


    belongs_to :show
    belongs_to :review, optional: true
    validates :score, presence: true
    

end
