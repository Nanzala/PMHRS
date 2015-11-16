class Patient < ActiveRecord::Base

    validates :name, presence:true
    validates :gender, presence:true
    validates :date_of_birth, presence:true

    belongs_to :records
end
