class Show < ApplicationRecord

    validates :name, presence: true
    validates :genre, presence: true
    validates :episodes, numericality: { only_integer: true }
    before_validation { self.status = self.status.downcase }
    validates :status, inclusion: { in: ["watching", "plan to watch", "watched"]}

    belongs_to :user 
    has_many :comments
    has_many :ratings 

end
