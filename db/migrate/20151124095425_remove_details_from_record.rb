class RemoveDetailsFromRecord < ActiveRecord::Migration
  def change
    remove_column :records, :medication_id, :string
    remove_column :records, :med_test_id, :string
  end
end
