# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Room, type: :model do
  it "is not valid without a user_id, room_id, hour and date" do
    room_booking = RoomBooking.new(user_id: nil, room_id: nil, hour: nil, date: nil)
    expect(room_booking).to_not be_valid
  end

  it "is not valid without a user_id" do
    room = FactoryGirl.create(:room)
    room_booking = RoomBooking.new(user_id: nil, room_id: room.id, hour: "06:00", date: Date.current.at_beginning_of_week)
    expect(room_booking).to_not be_valid
  end

  it "is not valid without a room_id" do
    user = FactoryGirl.create(:user)
    room_booking = RoomBooking.new(user_id: user.id, room_id: nil, hour: "06:00", date: Date.current.at_beginning_of_week)
    expect(room_booking).to_not be_valid
  end

  it "is not valid without a hour" do
    user = FactoryGirl.create(:user)
    room = FactoryGirl.create(:room)
    room_booking = RoomBooking.new(user_id: user.id, room_id: room.id, hour: nil, date: Date.current.at_beginning_of_week)
    expect(room_booking).to_not be_valid
  end

  it "is not valid without a date" do
    user = FactoryGirl.create(:user)
    room = FactoryGirl.create(:room)
    room_booking = RoomBooking.new(user_id: user.id, room_id: room.id, hour: "06:00", date: nil)
    expect(room_booking).to_not be_valid
  end

  it "valid room booking" do
    user = FactoryGirl.create(:user)
    room = FactoryGirl.create(:room)
    room_booking = RoomBooking.new(user_id: user.id, room_id: room.id, hour: "06:00", date: Date.current.at_beginning_of_week)
    expect(room_booking).to be_valid
  end
end
