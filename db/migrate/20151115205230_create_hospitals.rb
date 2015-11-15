class CreateHospitals < ActiveRecord::Migration
    def change
        create_table :hospitals, id:false do |t|
            t.string :id, null:false
            t.string :name
            t.string :location
            t.string :level
            t.string :address

            t.timestamps null: false
        end
        add_index :hospitals, :id, unique: true
    end
end
