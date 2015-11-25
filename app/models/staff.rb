class Staff < ActiveRecord::Base

    attr_encrypted :ssn, :key => Rails.application.secrets.encryption_key

    # Include default devise modules. Others available are:
    #  and :omniauthable, :confirmable, :lockable, 
    devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable,
        :timeoutable
    belongs_to :records

end
