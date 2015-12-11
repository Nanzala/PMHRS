class Permission < ActiveRecord::Base
  belongs_to  :hospital
  belongs_to  :record
end
