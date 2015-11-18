class Staff < ActiveRecord::Base

  validates  :name, presence: true
  validates  :phone, presence: true, 
             length: { within: 10..12 }
  validates  :address, presence: true
  validates  :role, presence: true

  belongs_to :records
    
end
