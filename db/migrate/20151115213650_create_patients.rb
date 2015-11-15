class CreatePatients < ActiveRecord::Migration
    def change
        create_table :patients, id:false do |t|
            t.string :id, null:false
            t.string :name
            t.string :gender
            t.date :date_of_birth
            t.string :phone
            t.string :email
            t.string :next_of_kin
            t.string :next_of_kin_contact

            t.timestamps null: false
        end
        add_index :patients, :id, unique: true
    end
end
