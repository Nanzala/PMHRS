class CreateMedications < ActiveRecord::Migration
  def change
    create_table :medications do |t|
      t.string :record_id
      t.string :medication

      t.timestamps null: false
    end
  end
end
