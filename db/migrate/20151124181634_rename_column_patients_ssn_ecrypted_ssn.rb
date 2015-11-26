class RenameColumnPatientsSsnEcryptedSsn < ActiveRecord::Migration
  def change
      rename_column :patients, :ssn, :encrypted_ssn
  end
end
