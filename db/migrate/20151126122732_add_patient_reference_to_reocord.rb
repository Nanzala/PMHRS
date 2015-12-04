class AddPatientReferenceToReocord < ActiveRecord::Migration
    def change
        remove_column :records, :patient_id
        add_reference :records, :patient, type: :uuid, index: true
        add_foreign_key :records, :patients
    end
end
