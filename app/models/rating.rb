class Rating < ApplicationRecord


    belongs_to :show
    has_many :users, through: :show
    validates :score, presence: true
    

end
