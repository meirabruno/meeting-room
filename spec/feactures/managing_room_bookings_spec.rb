require 'rails_helper'

describe 'As a user', type: :feature do
  let(:user) { FactoryGirl.create(:user) }
  let(:room) { FactoryGirl.create(:room) }

  before(:each) do
    sign_in user
    room.save
  end

  specify 'I can reserve room', js: true do
    visit room_path(room)

    2.times { click_link('Disponível', match: :first) }

    expect(user.room_bookings.count).to eq(1)
  end
end
