class AlterStaffTableColumns < ActiveRecord::Migration
  def change
      remove_column :staffs, :confirmation_token
      remove_column :staffs, :confirmed_at
      remove_column :staffs, :confirmation_sent_at
      change_column :staffs, :encrypted_password, :string, :null => true
  end
end
