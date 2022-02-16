class Rating < ApplicationRecord


    belongs_to :show
    belongs_to :review
    validates :score, presence: true

    def review_id=(id)
        self.review = Review.find_by(id: id)
    end

    def review_id
        self.review ? self.review.id : nil
    end
    

end
