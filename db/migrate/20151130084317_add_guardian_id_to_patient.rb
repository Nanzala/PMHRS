class AddGuardianIdToPatient < ActiveRecord::Migration
  def change
      add_column :patients, :parent_ssn, :string
  end
end
