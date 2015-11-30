class Record < ActiveRecord::Base
  validates :patient_id,  presence:true
  validates :staff_id,    presence:true

  belongs_to :patient
  has_many  :hospitals, through: :permissions
  has_many :staffs
  has_many :medications
  has_many :med_tests
end
