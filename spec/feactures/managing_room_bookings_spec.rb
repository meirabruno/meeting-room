require 'rails_helper'

describe 'As a user', type: :feature, js: true do
  let(:user) { FactoryGirl.create(:user) }
  let(:room) { FactoryGirl.create(:room) }

  before(:each) do
    sign_in user
  end

  it 'I can reserve room' do
    visit room_path(room)
    click_link("Disponível", match: :first)
    wait_for_ajax
    expect(RoomBooking.count).to eq(1)
  end

  it 'I can cancel reserve room' do
    room_booking = RoomBooking.create(user_id: user.id, room_id: room.id, date: Date.current.at_beginning_of_week, hour: "10:00")
    visit room_path(room)
    click_link("Cancelar", match: :first)
    wait_for_ajax
    expect(RoomBooking.count).to eq(0)
  end
end
