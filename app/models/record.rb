class Record < ActiveRecord::Base
    validates :patient_id,  presence:true
    validates :hospital_id, presence:true
    validates :staff_id,    presence:true

    belongs_to :patients
    belongs_to :hospitals
    has_many :staffs
    has_many :medications
    has_many :med_tests

    has_one :continues_from, class_name:  "Record",
        foreign_key: "record_id"
end
