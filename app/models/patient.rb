class Patient < ActiveRecord::Base
    self.primary_key = 'id'

    validates :id, presence:true
    validates :name, presence:true
    validates :gender, presence:true
    validates :date_of_birth, presence:true

end
