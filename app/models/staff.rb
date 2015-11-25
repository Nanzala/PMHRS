class Staff < ActiveRecord::Base
    # Include default devise modules. Others available are:
    #  and :omniauthable, :confirmable, :lockable, 
    devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable,
        :timeoutable


    attr_encrypted :ssn, :key => Rails.application.secrets.encryption_key

    #
    # validates  :name, presence: true
    # validates  :phone, presence: true, 
    #     length: { within: 10..22 }
    # validates  :address, presence: true
    # validates  :role, presence: true

    belongs_to :records

end
