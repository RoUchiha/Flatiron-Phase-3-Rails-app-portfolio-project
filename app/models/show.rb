class Show < ApplicationRecord

    validates :name, presence: true
    after_validation { self.name = self.name.titleize }
    validates :genre, presence: true
    after_validation { self.genre = self.genre.titleize }
    validates :episodes, presence: true, numericality: { only_integer: true }
    before_validation { self.status = self.status.downcase }
    validates :status, presence: true, inclusion: { in: ["watching", "plan to watch", "watched"]}
    after_validation { self.status = self.status.titleize }

    belongs_to :user 
    has_one :comment
    has_one :rating

end
