class Patient < ActiveRecord::Base

    devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable,
        :confirmable, :lockable, :timeoutable

    # attr_encrypted :ssn, :key => Rails.application.secrets.encryption_key

    validates :name, presence:true
    validates :ssn, presence:true
    validates :gender, presence:true
    validates :date_of_birth, presence:true
    validates :phone, presence:true, 
        length: { within: 10..22 }
    validates :next_of_kin, presence: true
    validates :next_of_kin_contact, presence: true,
        length: {within: 10..22 }

    has_many :records
end
