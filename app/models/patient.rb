class Patient < ActiveRecord::Base

    MINOR_AGE_LIMIT = 16
    attr_encrypted :ssn, :key => Rails.application.secrets.encryption_key

    validates :name, presence:true
    validates :ssn, presence:true
    validates :gender, presence:true
    validates :date_of_birth, presence:true
    validates :phone, presence:true, 
        length: { within: 10..12 }
    validates :next_of_kin, presence: true
    validates :next_of_kin_contact, presence: true,
        length: {within: 10..12 }
    validates :parent_ssn, presence: true, if: Proc.new do |p|
        age(p.date_of_birth) < MINOR_AGE_LIMIT
    end

    has_many :records

    def age(birthday)
        today = Date.today

        if today.month > birthday.month
            today.year - birthday.year
        elsif today.month < birthday.month
            today.year - birthday.year - 1
        else
            if today.day >= birthday.day
                today.year - birthday.year
            else
                today.year - birthday.year - 1
            end
        end
    end

end
