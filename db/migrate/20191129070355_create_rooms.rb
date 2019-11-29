class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
      t.string :room_number, null: false, index: {unique: true}
      t.string :apartment, null: false
      t.integer :unit, null: false
      t.integer :capacity, null: false
      t.integer :amount, null: false, default: 0
      t.string :gender
      t.integer :floor, null: false
      t.string :department
      t.string :suite, null: false

      t.timestamps
    end
  end
end
