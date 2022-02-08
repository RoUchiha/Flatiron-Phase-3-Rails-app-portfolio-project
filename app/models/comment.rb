class Comment < ApplicationRecord

    validates :content, length: {minimum: 1 }

    belongs_to :user 
    belongs_to :show 

end
