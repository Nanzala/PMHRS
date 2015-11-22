class Patient < ActiveRecord::Base

    validates :name, presence:true
    validates :gender, presence:true
    validates :date_of_birth, presence:true
    validates :phone, presence:true, 
              length: { within: 10..12 }
    validates :next_of_kin, presence: true
    validates :next_of_kin_contact, presence: true,
              length: {within: 10..12 }

    has_many :records
end
