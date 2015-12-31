class Record < ActiveRecord::Base

  validates :patient_id,  presence:true
  validates :staff_id,    presence:true
  validates :height,      presence:true, numericality: { greater_than: 0, less_than: 240 }
  validates :weight,      presence:true, numericality: { greater_than: 0 }
  validates :temperature, presence:true, numericality: true


  belongs_to :patient
  validates_associated :patient
  has_many :hospitals, through: :permissions
  has_many :staffs
  has_many :medications
  has_many :med_tests

  has_one :continues_from, class_name:  "Record",
        foreign_key: "record_id"

  def self.save_record?(record, hospital_id)
    Record.transaction do
      record.save!
      Permission.create!(record_id: record.id, hospital_id: hospital_id)
    end
      return true
  end
end
