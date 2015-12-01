class AddValidUntilToStaffSignup < ActiveRecord::Migration
  def change
      add_column :staff_signups, :valid_until, :date
      add_column :staff_signups, :activated, :boolean
  end
end
