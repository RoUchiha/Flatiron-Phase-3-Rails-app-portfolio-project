class Rating < ApplicationRecord

    
    belongs_to :show
    validates :score, presence: true
    

end
