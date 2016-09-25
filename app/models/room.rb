# frozen_string_literal: true
class Room < ApplicationRecord
  validates :name, presence: true
  has_many :room_bookings, dependent: :destroy

  SCHEDULES = [
                            "06:00", "07:00", "08:00", "09:00", "10:00", "11:00", "12:00",
                            "13:00", "14:00", "15:00", "16:00", "17:00", "18:00", "19:00",
                            "20:00", "21:00", "22:00", "23:00"
                          ].freeze
end
