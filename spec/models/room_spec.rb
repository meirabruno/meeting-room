# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Room, type: :model do
  it "is not valid without a name" do
    room = Room.new(name: nil)
    expect(room).to_not be_valid
  end

  it "valid room" do
    room = Room.new(name: 'Sala 1')
    expect(room).to be_valid
  end
end
