class Staff < ActiveRecord::Base

    validates :name, presence:true

    belongs_to :records
    
end
