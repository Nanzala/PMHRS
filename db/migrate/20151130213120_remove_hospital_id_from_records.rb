class RemoveHospitalIdFromRecords < ActiveRecord::Migration
  def change
    remove_column :records, :hospital_id, :string
  end
end
