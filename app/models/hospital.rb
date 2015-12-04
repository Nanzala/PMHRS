class Hospital < ActiveRecord::Base
  validates :name,     presence: true
  validates :location, presence: true
  validates :level,    presence: true
  validates :address,  presence: true

  has_many  :records
end
