class Event < ApplicationRecord
  has_many :bookings, dependent: :destroy;
  validates :name, presence: true, uniqueness: true

   t.string "location"
    t.date "date"
    t.time "time"
    t.integer "min_p"
    t.integer "max_p"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false

end
