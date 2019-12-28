class ChangeRooms < ActiveRecord::Migration[5.1]
  def change
    change_column_null :rooms, :room_number, true
    change_column_null :rooms, :apartment, true
    change_column_null :rooms, :unit, true
    change_column_null :rooms, :capacity, true
    change_column_null :rooms, :amount, true
    change_column_null :rooms, :floor, true
    change_column_null :rooms, :suite, true
    change_column_null :rooms, :created_at, true
    change_column_null :rooms, :updated_at, true

    remove_column :rooms, :created_at, :datetime
    remove_column :rooms, :updated_at, :datetime
    rename_column :rooms, :room_number, :name
    add_column :rooms, :number, :integer
    add_reference :rooms, :suite, foreign_key: true
    remove_column :rooms, :gender, :string
    remove_column :rooms, :floor, :integer
    remove_column :rooms, :department, :string
    remove_column :rooms, :suite, :string
    remove_column :rooms, :apartment, :string
    remove_column :rooms, :unit, :integer
    add_reference :rooms, :team, foreign_key: true
  end
  def self.up

  end
end