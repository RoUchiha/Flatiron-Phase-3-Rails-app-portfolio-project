class Show < ApplicationRecord

    validates :name, presence: true
    validates :genre, presence: true
    validates :episodes, presence: true, numericality: { only_integer: true }
    before_validation { self.status = self.status.downcase }
    validates :status, presence: true, inclusion: { in: ["watching", "plan to watch", "watched"]}
    after_validation { self.status = self.status.capitalize }

    belongs_to :user 
    has_many :comments
    has_one :rating

end
