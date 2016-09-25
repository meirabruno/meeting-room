# frozen_string_literal: true
class RoomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)

    if @room.save
      redirect_to rooms_path, notice: 'Sala criada com sucesso'
    else
      render :new
    end
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])

    if @room.update(room_params)
      redirect_to rooms_path, notice: 'Sala atualizada com sucesso'
    else
      render :edit
    end
  end

  def show
    @room = Room.find(params[:id])
    @weekdays = ((Date.current.at_beginning_of_week)..(Date.current.at_end_of_week - 2.days)).to_a
    @room_bookings = RoomBooking.where(date: @weekdays)
  end

  def destroy
    @room = Room.find(params[:id])
    if @room.destroy
      redirect_to rooms_path, notice: 'Sala deletada com sucesso'
    else
      redirect_to rooms_path, notice: 'Não foi possivel deletar sala, tente mais tarde'
    end
  end

  private
  def room_params
    params.require(:room).permit(:name)
  end
end
