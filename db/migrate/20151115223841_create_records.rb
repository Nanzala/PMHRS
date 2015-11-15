class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records, id:false do |t|
      t.string :id, null:false
      t.string :patient_id, null:false
      t.string :hospital_id, null:false
      t.string :staff_id, null:false
      t.integer :height
      t.integer :weight
      t.integer :temperature
      t.string :blood_pressure
      t.string :symptoms
      t.string :diagnosis
      t.string :medication_id
      t.string :med_test_id

      t.timestamps null: false
    end
    add_index :records, :id, unique:true
  end
end
