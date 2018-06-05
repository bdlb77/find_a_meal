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
end
