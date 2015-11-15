class Staff < ActiveRecord::Base
    self.primary_key='id'

    validates :id, presence:true
    validates :name, presence:true

    belongs_to :records
    
end
