class Car < ApplicationRecord
    searchkick
    belongs_to :user
    has_many :contracts
    has_many_attached :photos
    geocoded_by :address
    after_validation :geocode, if: :will_save_change_to_address?

 #   include PgSearch::Model
 #   pg_search_scope :global_search,
 #   against: [ :model, :description, :address, :category, ],
 #   associated_against: {},
 #   using: {
 #     tsearch: { prefix: true }
 #   }
end
