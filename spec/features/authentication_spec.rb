# frozen_string_literal: true
require 'rails_helper'

describe "User Authentication", type: :feature do
  let(:user) { FactoryGirl.create(:user, password: "123456") }

  describe "can sign in" do
    specify 'as an user' do
      visit new_user_session_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: "123456"
      click_on 'Entrar'
      expect(current_path).to eq root_path
    end

    specify 'as an user and password incorrect' do
      visit new_user_session_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: "654321"
      click_on 'Entrar'
      expect(current_path).to eq new_user_session_path
    end

    specify 'as an user and email incorrect' do
      visit new_user_session_path
      fill_in 'user[email]', with: "emailincorrect@teste.com"
      fill_in 'user[password]', with: "123456"
      click_on 'Entrar'
      expect(current_path).to eq new_user_session_path
    end
  end
end
