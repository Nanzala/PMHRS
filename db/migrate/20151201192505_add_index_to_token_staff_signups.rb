class AddIndexToTokenStaffSignups < ActiveRecord::Migration
  def change
      add_index :staff_signups, :token
  end
end
