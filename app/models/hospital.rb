class Hospital < ActiveRecord::Base
    validates :name,     presence: true
    validates :location, presence: true
    validates :level,    presence: true
    validates :address,  presence: true
    validates :ref,      presence: true

    has_many  :permissions
    has_many  :records, through: :permissions

    has_many :staffs, through: :assingments
    has_and_belongs_to_many :staffs
end
