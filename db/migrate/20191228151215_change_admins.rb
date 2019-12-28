class ChangeAdmins < ActiveRecord::Migration[5.1]
  def change
    change_column_null :admins, :account, true
    change_column_null :admins, :password, true
    change_column_null :admins, :email, true
    change_column_null :admins, :created_at, true
    change_column_null :admins, :updated_at, true

    remove_column :admins, :created_at, :datetime
    remove_column :admins, :updated_at, :datetime
    add_index :admins, :account, unique: true
  end
end