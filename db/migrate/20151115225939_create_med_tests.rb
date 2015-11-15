class CreateMedTests < ActiveRecord::Migration
  def change
    create_table :med_tests do |t|
      t.string :record_id
      t.string :test
      t.string :result

      t.timestamps null: false
    end
  end
end
