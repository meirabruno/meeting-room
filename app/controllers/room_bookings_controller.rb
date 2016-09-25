# frozen_string_literal: true
class RoomBookingsController < ApplicationController
  before_action :authenticate_user!

  def create
    RoomBooking.create!(room_id: params[:room], user: current_user, date: params[:date], hour: params[:hour])
    head :ok
  end

  def destroy
    @room_booking = RoomBooking.find(params[:id])
    if @room_booking.user == current_user
      @room_booking.destroy
    end
    head :ok
  end
end
