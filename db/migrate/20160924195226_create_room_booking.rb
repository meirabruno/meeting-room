class CreateRoomBooking < ActiveRecord::Migration[5.0]
  def change
    create_table :room_bookings do |t|
      t.date :date, null: false
      t.string :hour, null: false
      t.references :room, null: false
      t.references :user, null: false

      t.timestamps null: false
    end
  end
end
