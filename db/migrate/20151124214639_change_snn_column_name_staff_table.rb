class ChangeSnnColumnNameStaffTable < ActiveRecord::Migration
  def change
      rename_column :staffs, :ssn, :encrypted_ssn
  end
end
