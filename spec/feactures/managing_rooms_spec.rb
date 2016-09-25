# frozen_string_literal: true
require 'rails_helper'

describe 'As a user', type: :feature do
  let(:user) { FactoryGirl.create(:user) }
  let(:room) { FactoryGirl.create(:room) }
  let(:room_edit) { FactoryGirl.create(:room) }
  let(:room_delete) { FactoryGirl.create(:room) }

  before(:each) do
    sign_in user
    room.save
    room_edit.save
    room_delete.save
  end

  specify 'I can list all rooms' do
    visit rooms_path
    expect(page).to have_content room.name
  end

  specify 'I can create new room' do
    visit new_room_path

    fill_in 'room[name]', with: 'Nova sala'
    click_on 'Criar Sala'
  end

  specify 'I can edit a room' do
    visit edit_room_path(room_edit)
    expect(page).to have_content "Editar Sala"
    fill_in 'room[name]', with: 'Novo Nome da Sala'
    click_on 'Atualizar Sala'
    expect(room_edit.reload.name).to eq 'Novo Nome da Sala'
  end

  specify 'I can delete a room' do
    visit rooms_path

    find(".cpy-delete-room-#{room_delete.id}").click
    expect(Room.all.reload.ids).not_to include(room_delete.id)
  end
end
