class RenameConfirmationTokenToTokenStaffSignups < ActiveRecord::Migration
  def change
      rename_column :staff_signups, :confirmation_token, :token
      change_column :staff_signups, :activated, :boolean, default: false
  end
end
