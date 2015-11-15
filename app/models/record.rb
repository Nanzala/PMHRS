class Record < ActiveRecord::Base
    self.primary_key = 'id'

    validates :id, presence:true
    validates :patient_id, presence:true
    validates :hospital_id, presence:true
    validates :staff_id, presence:true

    has_many :patients
    has_many :hospitals
    has_many :staffs
    has_many :medications
    has_many :med_tests

end
