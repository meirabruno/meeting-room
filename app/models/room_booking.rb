# frozen_string_literal: true
class RoomBooking < ApplicationRecord
  validates :hour, presence: true
  validates :date, presence: true

  belongs_to :user
  belongs_to :room
end
