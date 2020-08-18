class Car < ApplicationRecord
    belongs_to :user

    has_many :contracts
    has_many_attached :photos
end
