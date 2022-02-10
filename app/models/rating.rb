class Rating < ApplicationRecord

    belongs_to :show
    validates :rating, presence: true
    validates :rating, numericality: { only_integer: true }
    validates :rating, inclusion: { in: 0..100 }

end
