class CreateHospitals < ActiveRecord::Migration
    def change
        create_table :hospitals, id: :uuid, default: "gen_random_uuid()", force: true do |t|
            t.string :name
            t.string :location
            t.string :level
            t.string :address

            t.timestamps null: false
        end
    end
end
