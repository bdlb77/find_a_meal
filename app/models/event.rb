class Event < ApplicationRecord

  has_many :bookings, dependent: :destroy;
  validates :name, presence: true, uniqueness: true
  validates :address, presence: true
  validates :date, presence: true
  validates :time, presence: true
  validates :description, presence: true
  validates :max_p, presence: true
  mount_uploader :photo, PhotoUploader
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

   include PgSearch
  pg_search_scope :search_by_date_and_price_and_name,
    against: [ :date, :price, :name ],
    using: {
      tsearch: { prefix: true }
    }
end
