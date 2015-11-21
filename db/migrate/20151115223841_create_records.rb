class CreateRecords < ActiveRecord::Migration
  def change
      create_table :records, id: :uuid, default: 'gen_random_uuid()', force:true do |t|
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
  end
end
