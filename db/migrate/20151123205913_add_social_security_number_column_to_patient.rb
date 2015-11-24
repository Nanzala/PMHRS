class AddSocialSecurityNumberColumnToPatient < ActiveRecord::Migration
  def change
    add_column :patients, :ssn, :string, unique: true, null: false
  end
end
