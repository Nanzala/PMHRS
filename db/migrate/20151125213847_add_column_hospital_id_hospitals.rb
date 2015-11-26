class AddColumnHospitalIdHospitals < ActiveRecord::Migration
  def change
      add_column :hospitals, :ref, :string, unique: true, null:false
  end
end
