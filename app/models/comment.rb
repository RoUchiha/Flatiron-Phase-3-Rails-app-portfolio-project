class Comment < ApplicationRecord

    validates :content, presence: true 
    validates :content, length: {minimum: 2 }

    belongs_to :user 
    belongs_to :show 

end