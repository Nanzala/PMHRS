class Medication < ActiveRecord::Base
  validates  :medication, presence:true

  belongs_to :records
end
