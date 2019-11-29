class CreateAdmins < ActiveRecord::Migration[5.1]
  def change
    create_table :admins do |t|
      t.string :account, null: false
      t.string :password, null: false
      t.string :email, null: false

      t.timestamps
    end
  end
end
