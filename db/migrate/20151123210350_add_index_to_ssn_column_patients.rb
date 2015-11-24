class AddIndexToSsnColumnPatients < ActiveRecord::Migration
  def change
      add_index :patients, :ssn
  end
end
