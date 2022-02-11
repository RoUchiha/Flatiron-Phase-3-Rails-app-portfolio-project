class Rating < ApplicationRecord

    belongs_to :show
    validates :rating, presence: true
    

end
